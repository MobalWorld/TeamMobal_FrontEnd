import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobalworld/src/Front/Group/group_select.dart';
import 'package:provider/provider.dart';

import '../Appbar page/alarm.dart';
import '../Appbar page/storage_3/storagebox_btn.dart';
import '../Setting/bottom.dart';
import '../Setting/theme_provider.dart';
import 'worry_miri.dart';

class GroupMain extends StatefulWidget {
  const GroupMain({Key? key}) : super(key: key);

  @override
  State<GroupMain> createState() => _GroupMainState();
}

final List<String> name = <String>['오이맛 수박', '이름 2', '이름 3'];
final List<String> title = <String>[
  '일찍 일어나고 싶다',
  '제목 2',
  '제목 3',
];
final List<String> content = <String>[
  '방학을 하고 항상 늦게 일어나고 있다. 빨리 일어나고 싶은데 온몸이 천근만근 너무 무겁다. 두근두근 설레는 마음으로 일어나고 싶어도 너무 잠이 부족하다. 수면부족의 큰 문제는 성격이 예민해진다는 것이고 이는 결국 다른 사람에게 상처를 줄 수 있을 만큼 예민해진다. 나는 언제쯤 잠을 많이 자게 될까? 그런데 주변을 보면 다들 늦게 자는 것 같다. 다크서클이 너무 심해서 동아리 이름을 다크라고 지어 다크서클이 되어도 좋을 것 같다. ',
  '내용 2',
  '내용 3',
];
final List<String> date = <String>['2023. 07. 18', '날짜 2', '날짜 3'];
final List<String> image = <String>[
  'assets/images/water52.jpg',
  'assets/images/peng1.jpg',
  'assets/images/peng2.jpg'
];

class _GroupMainState extends State<GroupMain> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Scaffold(
      backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFFBF9F4),
      appBar: AppBar(
        backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFFBF9F4),
        toolbarHeight: 80,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new, color: isDarkMode ? Colors.white : Colors.black
          ),
          onPressed: () {
            Get.to(GroupSelect());
          },
        ),
        title: Text(
          '23-1 한동 위로 팀',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(Storagebox());
            },
            icon: FaIcon(FontAwesomeIcons.envelope, color: isDarkMode ? Colors.white : Colors.black,),
          ),
          IconButton(
            onPressed: () {
              Get.to(AlarmPage());
            },
            icon:
              FaIcon(FontAwesomeIcons.solidBell, color: isDarkMode ? Colors.white : Colors.black),

          ),
        ],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 0.025.sw,
              ),
              child: Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isDarkMode ? Color(0xFF242625) : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                RichText(
                text: TextSpan(
                text: '우리 팀의 이번주 위로왕 ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: '바다 표범',
                      style: TextStyle(
                        fontSize: 15,
                        color: isDarkMode ? Color(0xFFFF6105) : Color(0xFFFF6105),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: '님의 한마디!',
                      style: TextStyle(
                        fontSize: 15,
                        color: isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage('assets/images/walrus.png'),
                          radius: 16, //프로필 사진 원 사이즈 -> 30으로 고정
                        ),
                        Text(
                          '모발모발 한동 위로팀! 다들 화이팅하자!!!',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 17.5,
                              color: isDarkMode? Color(0xFFCDE5FF) : Colors.indigoAccent),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.025.sw, vertical: 0.04.sh),
                itemCount: name.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    // 박스 사이 간격 수정
                    padding: EdgeInsets.only(bottom: 20),
                    child: Container(
                      height: 140,
                      decoration: BoxDecoration(
                        color: isDarkMode ? Color(0xFF242625) : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  backgroundColor: isDarkMode ? Color(0xFF62626B) : Color(0xFFEFF0F2),
                                  title: Text('알림',style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),),
                                  content: Text(
                                      '고민에 대한 응답은 한번밖에 할 수 없어요! 진심을 담은 고민 답변 부탁드립니다 🧡',style: TextStyle(color: isDarkMode ? Colors.white : Colors.black)),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Get.back();
                                        // Close the AlertDialog
                                      },
                                      child: Text('취소',style: TextStyle(color: isDarkMode ? Colors.white : Colors.black)),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Get.to(
                                            WorryMiri()); // Close the AlertDialog
                                      },
                                      child: Text('확인',style: TextStyle(color: isDarkMode ? Colors.white : Colors.black)),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        backgroundImage:
                                            AssetImage(image[index]),
                                        radius: 20,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        name[index],
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: isDarkMode ? Colors.white : Colors.black),
                                      ),
                                      // 이름과 날짜 사이 간격
                                      SizedBox(width: 9),
                                      Text(
                                        date[index],
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: isDarkMode ? Colors.white : Colors.black),
                                      ),
                                    ],
                                  ),
                                  // 이름과날짜 <-> 제목 사이 간격
                                  SizedBox(height: 8),
                                  // 제목
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          title[index],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: isDarkMode ? Colors.white : Colors.black
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // 제목 <-> 내용 간격
                                  SizedBox(
                                    height: 8,
                                  ),
                                  // 내용
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          content[index],
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: isDarkMode ? Colors.white : Colors.black),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
