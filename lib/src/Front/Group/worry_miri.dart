import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobalworld/src/Front/Setting/bottom.dart';
import 'package:mobalworld/src/Front/appbar%20page/storage_3/storagebox_btn.dart';
import 'package:provider/provider.dart';

import '../Appbar page/alarm.dart';
import '../Color_UI/padding.dart';
import '../Setting/bottomNav.dart';
import '../Setting/theme_provider.dart';
import '../Wiro_Writing/wiro_writing.dart';
import 'group_main.dart';

class WorryMiri extends StatefulWidget {
  const WorryMiri({Key? key}) : super(key: key);

  @override
  State<WorryMiri> createState() => _WorryMiriState();
}

final List<String> name = <String>['오이맛 수박'];
final List<String> title = <String>[
  '일찍 일어나고 싶다',
];
final List<String> content = <String>[
  '방학을 하고 항상 늦게 일어나고 있다. 빨리 일어나고 싶은데 온몸이 천근만근 너무 무겁다. 두근두근 설레는 마음으로 일어나고 싶어도 너무 잠이 부족하다. 수면부족의 큰 문제는 성격이 예민해진다는 것이고 이는 결국 다른 사람에게 상처를 줄 수 있을 만큼 예민해진다. 나는 언제쯤 잠을 많이 자게 될까? 그런데 주변을 보면 다들 늦게 자는 것 같다. 다크서클이 너무 심해서 동아리 이름을 다크라고 지어 다크서클이 되어도 좋을 것 같다. ',
];
final List<String> date = <String>['2023. 07. 18'];
final List<String> image = <String>[
  'assets/images/water52.jpg',
];

class _WorryMiriState extends State<WorryMiri> {
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
            Icons.arrow_back_ios_new,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          onPressed: () {
            Get.to(BottomNavi());
          },
        ),
        title: Text(
          '23-1 한동 위로팀',
          style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(AlarmPage());
              },
              icon: FaIcon(FontAwesomeIcons.solidBell, color: isDarkMode ? Colors.white : Colors.black)),
        ],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 0.06.sh,
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  padding: GetPadding(),
                  itemCount: name.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 0.40.sh,
                      decoration: BoxDecoration(
                        color: isDarkMode ? Color(0xFF242625) : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Transform.translate(
                            offset: Offset(5, -20), // 왼쪽 상단으로 이동
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(image[index]),
                              radius: 20,
                            ),
                          ),
                          Padding(
                            padding: GetPadding(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // 이름과 날짜
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name[index],
                                      style: TextStyle(fontSize: 14,color: isDarkMode ? Colors.white : Colors.black,
                                      ),
                                    ),
                                    // 이름과 날짜 사이 간격
                                    SizedBox(width: 9),
                                    Text(
                                      date[index],
                                      style: TextStyle(fontSize: 14,color: isDarkMode ? Colors.white : Colors.black,),
                                    ),
                                  ],
                                ),
                                // 이름과날짜 <-> 제목 사이 간격
                                SizedBox(height: 8),
                                // 제목
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        title[index],
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: isDarkMode ? Colors.white : Colors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        content[index],
                                        style: TextStyle(fontSize: 12,color: isDarkMode ? Colors.white : Colors.black,),
                                        maxLines: 8,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: GetPadding(),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: isDarkMode ? Colors.black : Colors.white, backgroundColor: isDarkMode ? Color(0xFFFF6105) : Color(0xFFFF6105),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      Get.to(WiroWriting());
                    },
                    child: Text(
                      '답변하기',
                      style: TextStyle(color: isDarkMode ? Colors.white : Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 0.325.sh,
            ),
          ],
        ),
      ),
    );
  }
}
