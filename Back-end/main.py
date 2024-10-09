from fastapi import FastAPI
from pydantic import BaseModel
from langchain_openai import ChatOpenAI, OpenAIEmbeddings
from langchain.prompts import PromptTemplate
from langchain.schema.runnable import RunnableSequence
from langchain_community.document_loaders import TextLoader, JSONLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain_community.vectorstores import FAISS
from fastapi.middleware.cors import CORSMiddleware
from pathlib import Path
from typing import List, Dict
import json
import random

# OpenAI 클라이언트 및 FastAPI 설정
app = FastAPI()
from langchain.schema import Document

# CORS 설정 추가
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # 모든 출처 허용
    allow_credentials=True,
    allow_methods=["*"],  # 모든 HTTP 메소드 허용
    allow_headers=["*"],  # 모든 헤더 허용
)

# 메시지 스키마 정의
class Message(BaseModel):
    content: str

# gpt-4o-mini
# gpt-4o
# LangChain 설정
llm = ChatOpenAI(model= 'gpt-4o', temperature=0.3)

# 파일 경로 확인
json_file_path = Path('kiosk.json')
manual_file_path = Path('manual.txt')
scenario_file_path = Path('scenario.txt')
history_file_path = Path('history.txt')

# 시나리오 생성 함수 정의
def load_data(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        return json.load(file)

def generate_scenario():
    # 각 JSON 파일에서 데이터 로드
    time_data = load_data('time.json')['time']
    people_data = load_data('people.json')['people']
    destination_data = load_data('destination.json')['destination']
    
    # 랜덤으로 시간, 인원, 목적지 선택
    chosen_time = random.choice(time_data)
    chosen_people = random.choice(people_data)
    chosen_destination = random.choice(destination_data)['name']
    
    # 시나리오 텍스트 생성
    scenario_text = f"목적지 = \"{chosen_destination}\"\n버스시간 = \"{chosen_time}\"\n인원 = \"{chosen_people}\"\n"
    
    # 시나리오를 scenario.txt에 저장
    with open('scenario.txt', 'w', encoding='utf-8') as file:
        file.write(scenario_text)
    
    return scenario_text

# 앱이 시작될 때 시나리오 생성
@app.on_event("startup")
def create_scenario_on_startup():
    scenario = generate_scenario()
    print(f"생성된 시나리오:\n{scenario}")

# JSON 파일 로드
if json_file_path.exists():
    with open(json_file_path, 'r', encoding='utf-8') as file:
        json_content = json.load(file)
else:
    raise FileNotFoundError(f"JSON 파일을 찾을 수 없습니다: {json_file_path}")

# 메뉴얼 텍스트 파일 로드
if scenario_file_path.exists():
    with open(scenario_file_path, 'r', encoding='utf-8') as file:
        scenario_content = file.read()
else:
    raise FileNotFoundError(f"텍스트 파일을 찾을 수 없습니다: {scenario_file_path}")

# 시나리오 텍스트 파일 로드
if manual_file_path.exists():
    with open(manual_file_path, 'r', encoding='utf-8') as file:
        manual_content = file.read()
else:
    raise FileNotFoundError(f"텍스트 파일을 찾을 수 없습니다: {manual_file_path}")

# 히스토리 텍스트 파일 로드
if history_file_path.exists():
    with open(history_file_path, 'r', encoding='utf-8') as file:
        history_content = file.read()
else:
    raise FileNotFoundError(f"텍스트 파일을 찾을 수 없습니다: {history_file_path}")

# 프롬프트 템플릿 설정 (문서의 내용을 반영)
prompt_template = """
당신은 60대 이상 어른에게 키오스크 사용에 도움을 주는 AI입니다.
사용자는 현재 누르고 있는 버튼에 대한 정보를 입력합니다. 입력에 대한 답변은 아래의 관련 문서를 참고해 답변해주세요.

Kiosk Context:
{context}

User Manual:
{manual}

The scenario that the user must follow:
{scenario}

Button information pressed by the user:
{question}

답변 (한국어로, 1줄만):
"""
prompt = PromptTemplate(template=prompt_template, input_variables=["scenario", "context", "manual", "history", "question"])

qa_chain = prompt | llm

def ask_question(query):
    # JSON 내용을 문자열로 변환
    context = json.dumps(json_content, ensure_ascii=False)

    # 프롬프트에 질문과 문서 내용 연결
    answer = qa_chain.invoke({"context": context,  "manual": manual_content, "scenario": scenario_content, "history": history_content, "question": query})
    
    return answer.content

# FastAPI 라우트 정의
@app.post("/chat")
async def chat(message: Message):
    # 사용자 질문을 처리하고 답변 생성
    print('사용자 입력 >> ' + message.content)
    response = ask_question(message.content)
    # 답변을 출력
    print('AI 답변 >> ' + response)
    with open('history.txt', 'a', encoding='utf-8') as file:
        file.write(f'사용자 입력 >> {message.content}\n')
        file.write(f'AI 답변 >>  {response}\n\n')
    return {"response": response}

# 시나리오 텍스트 확인용 라우트
@app.get("/scenario")
async def get_scenario():
    with open('scenario.txt', 'r', encoding='utf-8') as file:
        scenario = file.read()
    return {"scenario": scenario}

# uvicorn main:app --reload
# uvicorn main:app --reload --host 0.0.0.0 --port 8000