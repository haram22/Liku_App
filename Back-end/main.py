from fastapi import FastAPI
from pydantic import BaseModel
from langchain_openai import OpenAI, OpenAIEmbeddings  # OpenAIEmbeddings를 langchain_openai에서 가져옴
from langchain.prompts import PromptTemplate
from langchain.schema.runnable import RunnableSequence  # RunnableSequence 가져오기
from langchain_community.document_loaders import TextLoader, JSONLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain_community.vectorstores import FAISS
from fastapi.middleware.cors import CORSMiddleware
from pathlib import Path  # 파일 경로 확인을 위한 Path 사용

# OpenAI 클라이언트 및 FastAPI 설정
app = FastAPI()

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

# LangChain 설정
llm = OpenAI('gpt-4o-mini', temperature=0.1)

# 파일 경로 확인
json_file_path = Path('kiosk.json')
#txt_file_path = Path('manual.txt')

# kiosk.json과 manual.txt 파일을 로드 (jq_schema 및 text_content 추가)
if json_file_path.exists():
    json_loader = JSONLoader(file_path=json_file_path, jq_schema=".", text_content=False)
else:
    raise FileNotFoundError(f"JSON 파일을 찾을 수 없습니다: {json_file_path}")

# if txt_file_path.exists():
#     txt_loader = TextLoader(file_path=txt_file_path)
# else:
#     raise FileNotFoundError(f"텍스트 파일을 찾을 수 없습니다: {txt_file_path}")

# 파일 내용을 불러옴
json_documents = json_loader.load()
#txt_documents = txt_loader.load()

# 텍스트 분할기
text_splitter = RecursiveCharacterTextSplitter(chunk_size=1000, chunk_overlap=0)

# 텍스트를 분할하여 조각으로 만듬
json_texts = text_splitter.split_documents(json_documents)
#txt_texts = text_splitter.split_documents(txt_documents)

# 두 파일의 텍스트 데이터를 합침 + txt_texts
all_texts = json_texts 

# 텍스트 임베딩 생성
embeddings = OpenAIEmbeddings()

# 텍스트를 임베딩하여 벡터 저장소에 저장
docsearch = FAISS.from_documents(all_texts, embeddings)

# 프롬프트 템플릿 설정 (문서의 내용을 반영)
prompt_template = """
당신은 60대 이상 어른에게 키오스크 사용에 도움을 주는 AI입니다.
사용자는 현재 누르고 있는 버튼에 대한 정보를 입력합니다. 입력에 대한 답변은 아래의 관련 문서를 참고해 답변해주세요. 대답은 간략하게 해주세요.

화면 흐름:
- 처음 화면
- 목적지 선택 화면
- 버스 시간 선택 화면
- 좌석 선택 화면
- 결제 화면
- 끝 화면

사용자가 눌렀던 버튼과 현재 화면의 정보를 기반으로 다음 행동을 안내해주세요.

사용자가 해야 하는 최종 미션은 [목적지 = "부산해운대", 버스시간 = "17:00", 인원 = "어른 2명"] 입니다.

사용자가 현재 어떤 화면에 있는지, 어떤 버튼을 눌렀는지를 바탕으로 미션을 수행할 수 있도록 단계별로 유도해주세요.

사용자가 현재 있는 화면과 버튼을 토대로 미션을 하나씩 해야 합니다. 

사용자가 누른 버튼 정보:
{question}

관련 문서 내용:
{context}

답변 (한국어로, 절대 영어 금지, 간략하게):
"""
prompt = PromptTemplate(template=prompt_template, input_variables=["context", "question"])

# 프롬프트와 LLM을 연결하여 체인 생성
qa_chain = prompt | llm

# 질문-답변 처리 함수
def ask_question(query):
    # 사용자 질문에 맞는 문서 검색
    docs = docsearch.similarity_search(query)
    
    # 검색된 문서를 연결하여 하나의 텍스트로 만듬
    context = "\n".join([doc.page_content for doc in docs])
    
    # RunnableSequence를 통해 질문에 대한 답변 생성
    answer = qa_chain.invoke({"context": context, "question": query})
    
    return answer

# FastAPI 라우트 정의
@app.post("/chat")
async def chat(message: Message):
    # 사용자 질문을 처리하고 답변 생성
    response = ask_question(message.content)
    
    # 답변을 출력
    print(response)
    return {"response": response}
# uvicorn main:app --reload