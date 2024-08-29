import 'package:flutter/material.dart';
import 'package:liku/Components/global.dart';
import '../Theme/Colors.dart';
import 'SelectComp.dart';

class LocationByWord extends StatefulWidget {
  final String? selectedRegion;
  
  const LocationByWord({Key? key, required this.selectedRegion})
      : super(key: key);

  @override
  _LocationByWordState createState() => _LocationByWordState();
}

class _LocationByWordState extends State<LocationByWord> {
  String? _selectedConsonant; // 선택된 초성
  final int itemsPerPage = 5;
  void updatePage(int newPage) {
    setState(() {
      currentPageNotifier.value = newPage;
    });
  }
  final Map<String, List<String>> regionLocations = {
    '특별/광역/자치': ['군단앞(포천)', '대전청사(선사유적)', '부산해운대(수도권)', '북대전IC', '세종', '세종청사', '울산', 
                      '울산신복', '유성시외', '인천', '자운대', '좌천', '현풍'],
    '강원도': ['15초소', '38연대', '간성', '강릉시외터미널', '강촌', '강포리', '거진', '검문소(명월)', '고석평', '고한사북공영', 
              '광덕계곡', '광덕산', '낙산', '남교', '내촌', '다목리', '달거리', '당림리', '대진', '덕다리', '동송', '동해', '두미르아파트', '두촌', '맹대', '면사무소(사북)', '명월리', '문막', '문혜리', '물치', '미다리', '미탄', '방림', '방림삼거리', '백담사', '백운동', '복지골', '사단앞', '사창리', '산양리', '삼척', '상남', '상노리', '상호아파트', '새말', '서오지리', '서천리', '서화(강원)', '성산', '성심병원', '소양뱃터', '속초', '송청리', '신남', '신수리', '신철원', '신포리', '아파트', '안보리', '안흥', '양구', '양구정중앙', '양덕원', '양양', '어리고개', '영월', '오색', '오색등산로', '오색흘림골', '와수리', '와야리', '용대삼거리', '운교', '원리분교', '원주', '원천리', '원통', '원평리', '유현리', '인제', '임원', '자등리', '장수대', '장신', '장평', '장호', '정선', '주문진', '주문진해변(청시행)', '지경리', '지촌', '진부', '진부령', '천도리', '철정', '청2리', '춘천', '춘천역', '태백', '평창', '풍수원', '하남(강원)', '하조대', '학사리', '한계령', '해안', '햇골', '현대아파트(춘천)', '현리(강원)', '현지사', '호산', '홍천', '화상대', '화천', '횡계', '횡성'],
    '경기도': ['6사단', '가산', '가천대', '가평', '갈운리', '공도', '관인', '광탄', '국수리', '내촌(포천)', '단월(양평)', 
              '당수동', '대림동산', '대성리', '대진대', '도예촌', '도평3리', '도평리', '동아방송대', '동탄', '두원공대', '만세교', '상록수', '성동2리', '성모병원(의정부)', '소학리', '송우리', '송탄', '시민회관', '신북(경기)', '신장(경기)', '아미리', '안산터미널', '안성', '안성풍림', '야미리', '양문', '양평', '여주', '여주대', '여주태평리', '영북농협', '오산', '용두(양평)', '용문', '용이동', '운악산휴게소', '의왕TG', '의정부', '이동', '이천', '이황리', '일동', '일죽', '장암(주공)', '장현', '장호원', '죽산', '중앙대(안성)', '청평', '축석고개', '평택', '평택대', '포천', '한경대', '한국관광대'],
    '경상남도': ['거제(고현)', '거창', '마천', '서상(남덕유산)', '수동(함양)', '신반', '안의', '양산', '의령', '이방', '적교', 
                '지리산(백무동)', '통영', '함양'],
    '경상북도': ['가은', '경북도청(신)', '경주시외', '구미', '군위', '금강송', '기성', '농암', '다인', '단촌', '도리원', '문경', 
                '봉화(경북)', '부구', '상주시외', '안계', '안동', '안동대', '안동초교', '영덕', '영양', '영주', '영해', '예천', '온정', '용궁', '용상', '울진', '은척', '의성', '일직', '입암', '점촌', '주왕산', '죽변', '지동', '진보', '청송', '춘양', '평해', '포항', '풍기IC', '풍양', '한방단지', '함창', '후포'],
    '전라남도': ['노고단(성삼재)', '목포', '순천', '여수', '해남'],
    '전라북도': ['군산','김제', '뱀사골', '부안', '익산', '인월'],
    '충청남도':['공주', '기지시', '논산', '당진', '봉강교', '부여', '서산', '아산(온양)', '어송', '운산', '음암', '천안', '태안'],
    '충청북도': ['감곡', '건국대(충주)', '광혜원', '괴산', '교통대', '구인사', '꽃동네', '단양', '단양상진', '대소', '덕산(충북)', '매포', '맹동', '무극', '미원', '보은', 
                '사평리(가곡)', '삼성', '상판', '생극', '서충주', '세명대', '속리산', '수안보', '영춘', '용원(충북)', '용포', '음성', '이월', '제천', '주덕', '증평', '진천', '창리', '청주', '청주대', '청주대정류소', '청주북부터미널', '충북보건대', '충북혁신도시', '충주'],
    '전국': ['15초소', '38연대', '6사단', '가산', '가은', '가천대', '가평', '간성', '갈운리', '감곡', '강릉시외터미널', '강촌', '강포리', '거제(고현)', '거진', '거창', 
            '건국대(충주)', '검문소(명월)', '경북도청(신)', '경주시외', '고석평', '고한사북공영', '공도', '공주', '관인', '광덕계곡', '광덕산', '광탄', '광혜원', '괴산', '교통대', '구미', '구인사', '국수리', '군단앞(포천)', '군산', '군위', '금강송', '기성', '기지시', '김제', '꽃동네', '낙산', '남교', '내촌', '내촌(포천)', '노고단(성삼재)', '논산', '농암', '다목리', '다인', '단양', '단양상진', '단월(양평)', '단촌', '달거리', '당림리', '당수동', '당진', '대림동산', '대성리', '대소', '대전청사(선사유적)', '대진', '대진대', '덕다리', '덕산(충북)', '도리원', '도예촌', '도평3리', '도평리', '동송', '동아방송대', '동탄', '동해', '두미르아파트', '두원공대', '두촌', '마천', '만세교', '매포', '맹대', '맹동면사무소(사북)', '명월리', '목포', '무극', '문경', '문막', '문혜리', '물치', '미다리', '미원', '미탄', '방림', '방림삼거리', '백담사', '백운동', '뱀사골', '보은', '복지골', '봉강교', '봉화(경북)', '부구', '부산해운대(수도권)', '부안', '부여', '북대전IC', '사단앞', '사창리', '사평리(가곡)', '산양리', '삼성', '삼척', '상남', '상노리', '상록수', '상주시외', '상판', '상호아파트', '새말', '생극', '서산', '서상(남덕유산)', '서오지리', '서천리', '서충주', '서화(강원)', '성동2리', '성모병원(의정부)', '성산', '성심병원', '세명대', '세종', '세종청사', '소양뱃터', '소학리', '속리산', '속초', '송우리', '송청리', '송탄', '수동(함양)', '수안보', '순천시민회관', '신남', '신반', '신북(경기)', '신수리', '신장(경기)', '신철원', '신포리', '아미리', '아산(온양)', '아파트', '안계', '안동', '안동대', '안동초교', '안보리', '안산터미널', '안성', '안성풍림', '안의', '안흥', '야미리', '양구', '양구정중앙', '양덕원', '양문', '양산', '양양', '양평', '어리고개', '어송', '여수', '여주', '여주대', '여주태평리', '영덕', '영북농협', '영양', '영월', '영주', '영춘', '영해', '예천', '오산', '오색', '오색등산로', '오색흘림골', '온정', '와수리', '와야리', '용궁', '용대삼거리', '용두(양평)', '용문', '용상', '용원(충북)', '용이동', '용포', '운교', '운산', '운악산휴게소', '울산', '울산신복', '울진', '원리분교', '원주', '원천리', '원통', '원평리', '유성시외', '유현리', '은척', '음성', '음암', '의령', '의성', '의왕TG', '의정부', '이동', '이방', '이월', '이천', '이황리', '익산', '인월', '인제', '인천', '일동', '일죽', '일직', '임원', '입암', '자등리', '자운대', '장수대', '장신', '장암(주공)', '장평', '장현', '장호', '장호원적교', '점촌', '정선', '제천', '좌천', '주덕', '주문진', '주문진해변(청시행)', '주왕산', '죽변', '죽산', '중앙대(안성)', '증평', '지경리', '지동', '지리산(백무동)', '지촌', '진보', '진부', '진부령', '진천', '창리', '천도리', '천안', '철정', '청2리', '청송', '청주', '청주대', '청주대정류소', '청주북부터미널', '청평', '축석고개', '춘양', '춘천', '춘천역', '충북보건대', '충북혁신도시', '충주', '태백', '태안', '통영', '평창', '평택', '평택대', '평해', '포천', '포항', '풍기IC', '풍수원', '풍양', '하남(강원)', '하조대', '학사리', '한경대', '한계령', '한국관광대', '한방단지', '함양', '함창', '해남', '해안', '햇골', '현대아파트(춘천)', '현리(강원)', '현지사', '현풍', '호산', '홍천', '화상대', '화천', '횡계', '횡성', '후포'],

  };

  final List<String> consonants = [
    'ㄱ',
    'ㄴ',
    'ㄷ',
    'ㄹ',
    'ㅁ',
    'ㅂ',
    'ㅅ',
    'ㅇ',
    'ㅈ',
    'ㅊ',
    'ㅋ',
    'ㅌ',
    'ㅍ',
    'ㅎ',
    '기타',
    '전체'
  ];

  @override
  Widget build(BuildContext context) {
    final List<String>? items = selectedRegionItems();
    late String dest;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(3.0),
          color: primaryBlack,
          child: GridView.count(
            crossAxisCount: 8,
            crossAxisSpacing: 3.0,
            mainAxisSpacing: 3.0,
            childAspectRatio: 2.5,
            shrinkWrap: true,
            children: consonants.map((consonant) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedConsonant = consonant == '전체' ? null : consonant;
                    currentPageNotifier.value = 0;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: _selectedConsonant == consonant || (_selectedConsonant == null && consonant == '전체')
                        ? primaryPurple
                        : Colors.white,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Center(
                    child: Text(
                      consonant,
                      style: TextStyle(fontSize: 16.0, color: _selectedConsonant == consonant || (_selectedConsonant == null && consonant == '전체')
                        ? Colors.white
                        : Colors.black,),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Expanded(
          child: items != null
              ? GridView.count(
                  padding: const EdgeInsets.all(5),
                  crossAxisCount: itemsPerPage,
                  crossAxisSpacing: 3.0,
                  mainAxisSpacing: 15.0,
                  childAspectRatio: 2.5,
                  children: List.generate(itemsPerPage*3, (index) {
                    int scheduleIndex = currentPageNotifier.value * itemsPerPage + index;
                    if (scheduleIndex >= items.length) {
                          return Container();
                        }
                    return GestureDetector(
                      onTap: () {
                          setState(() {
                            dest = items[scheduleIndex];
                            destNotifier.value = dest;
                            Navigator.pushReplacementNamed(context, '/selectTime', arguments: dest);
                          });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: primaryBlack,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Center(
                          child: Text(
                            items[scheduleIndex],
                            style: TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  }),
                )
              : Center(
                  child: Text(
                    '지역을 선택하세요',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  
                ),
                
        ),
        Container(
          child: Center(
          child: items != null
            ? ButtonComp(
            page: currentPageNotifier.value,
            totalItems: items.length,
            itemsPerPage: itemsPerPage,
            onPageChanged: updatePage,
            pass: 3,
          )
        : SizedBox(), // items가 null일 때 빈 위젯을 반환
  ),
)
      ],
    );
  }

  List<String>? selectedRegionItems() {
    final List<String>? items = regionLocations[widget.selectedRegion];

    if (items == null) return null;

    if (_selectedConsonant != null) {
      return items.where((item) {
        final consonant = getConsonant(item);
        return consonant == _selectedConsonant;
      }).toList();
    }
    return items;
  }
}

String? getConsonant(String input) {
  if (input.isEmpty) return null;

  final int codeUnit = input.codeUnitAt(0);

  // 한글의 범위인지 확인
  if (codeUnit < 0xAC00 || codeUnit > 0xD7A3) {
    return null; // 한글이 아니면 null을 반환
  }

  final int firstConsonantIndex = ((codeUnit - 0xAC00) ~/ 28) ~/ 21;
  const consonantsList = [
    'ㄱ',
    'ㄲ',
    'ㄴ',
    'ㄷ',
    'ㄸ',
    'ㄹ',
    'ㅁ',
    'ㅂ',
    'ㅃ',
    'ㅅ',
    'ㅆ',
    'ㅇ',
    'ㅈ',
    'ㅉ',
    'ㅊ',
    'ㅋ',
    'ㅌ',
    'ㅍ',
    'ㅎ'
  ];

  return consonantsList[firstConsonantIndex];
}
