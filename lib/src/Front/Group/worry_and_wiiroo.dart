import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobalworld/src/Front/Appbar%20page/storage_3/worry_storage.dart';
import 'package:mobalworld/src/Front/Color_UI/padding.dart';
import 'package:provider/provider.dart';
import '../Setting/theme_provider.dart';

class FinStorage extends StatefulWidget {
  const FinStorage({Key? key}) : super(key: key);

  @override
  State<FinStorage> createState() => _FinStorageState();
}


class _FinStorageState extends State<FinStorage> {
  bool isThumb =true;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Scaffold(
      backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFFBF9F4),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
            },
            icon: FaIcon(FontAwesomeIcons.faceAngry, color: isDarkMode ? Colors.white : Colors.black,),
          ),

          // 따봉 작업 시작
          IconButton(
            onPressed: () {
           // 이 자리에 넣기 
              setState(() { // 상태 업데이트를 위해 setState 사용
                isThumb = !isThumb; // 상태 변경
              });
            },
            icon: FaIcon(isThumb ? FontAwesomeIcons.thumbsUp : FontAwesomeIcons.solidThumbsUp,
              color: isDarkMode ? Colors.white : Colors.black,),
          ),
        ],
        backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFFBF9F4),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          onPressed: () {
            Get.to(Worry_StoragePage());
          },
          color: Colors.black,
        ),
        title: Column(
          children: [
            Text('2023년 07월 11일',style: TextStyle(color: isDarkMode ? Colors.white : Colors.black,),),
            Text('23-1 한동 위로팀',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                )),


          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: GetPadding(),
          child: Column(
            children: [
              SizedBox(
                height: 0.08.sh,
              ),
              Center(
                child: Column(
                  children: [
                    Container(
                      height: 0.3.sh,
                      decoration: BoxDecoration(
                        color: isDarkMode ? Color(0xFF242625) : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.02.sh, vertical: 0.02.sh),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '고민 제목',
                              style: TextStyle(fontSize: 20,color: isDarkMode ? Colors.white : Colors.black,),
                            ),
                            Divider(
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                            Text(
                              '내용',
                              style: TextStyle(fontSize: 15,color: isDarkMode ? Colors.white : Colors.black,),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.05.sh,
                    ),
                    Container(
                      height: 0.3.sh,
                      decoration: BoxDecoration(
                        color: isDarkMode ? Color(0xFF242625) : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.02.sh, vertical: 0.02.sh),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage(
                                      'assets/images/walrus.png',
                                    )),
                                SizedBox(
                                  width: 0.02.sh,
                                ),
                                Text(
                                  'From. 바다표범',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: isDarkMode ? Colors.white : Colors.black,),
                                ),
                              ],
                            ),
                            Divider(
                              color: isDarkMode ? Colors.white : Colors.black,),
                            Text(
                              '내용',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: isDarkMode ? Colors.white : Colors.black,),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}

