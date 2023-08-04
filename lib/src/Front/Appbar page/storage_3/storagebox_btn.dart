import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobalworld/src/Front/Group/group_main.dart';
import 'package:provider/provider.dart';

import '../../Setting/bottomNav.dart';
import '../../Setting/theme_provider.dart';
import 'storage.dart';
import 'temporary_storage.dart';
import 'worry_storage.dart';
import '../../Setting/bottom.dart';
import '../../Setting/master_key.dart';

class Storagebox extends StatefulWidget {
  const Storagebox({Key? key}) : super(key: key);

  @override
  State<Storagebox> createState() => _StorageboxState();
}

class _StorageboxState extends State<Storagebox> {


  //보관함에서만 작동하는 보관함 박스 button을 위젯화 - 만듦
  Widget getButton({required String hint, required Widget nextPage}) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return SizedBox(
        width: double.infinity,
        // 버튼 높이
        height: Getheight(0.02.sh),
        child: ElevatedButton(
          onPressed: () {
            Get.to(nextPage);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(isDarkMode ? Color(0xFF242625) : Colors.white),
            overlayColor: MaterialStateProperty.all(isDarkMode ? Color(0xFF242625) : Colors.white),
            foregroundColor: MaterialStateProperty.all(isDarkMode ? Colors.white : Colors.black),
            padding: //패딩

                MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 14.h)),

            textStyle: MaterialStateProperty.all(TextStyle(
              fontSize: FontSize(20.sp),
              fontWeight: FontWeight.w700,
              fontFamily: 'Yeongdeok Blueroad'
            )),
            side: MaterialStateProperty.all(BorderSide(
              width: 1.0, // 테두리의 두께를 조정하세요
              // 테두리 색상 분홍색으로 변경
              color: isDarkMode ? Color(0xFF242625) : Colors.white, // 테두리의 색상을 원하는 색상으로 변경하세요
            )),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20.0), // 원하는 모서리의 둥근 정도를 조정하세요
              ),
            ),
          ),
          child: Text(hint,style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),),
        ));
  }

  //버튼의 임계값
  double Getheight(double size) {
    if (size < 100) {
      size = 100;
    }
    return size;
  }

  //fontsize의 임계값
  double FontSize(double size) {
    if (size > 30) size = 30;
    return size;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Scaffold(
      backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFEFF0F2),
      appBar: AppBar(
        backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFEFF0F2),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          onPressed: () {
            Get.to(BottomNavi());
          },
        ),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 0.03.sh, vertical: 0.02.sh),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/peng1.jpg'),
                radius: 50,
              ),
              SizedBox(
                height: 0.015.sh,
              ),
              Text(
                '남극 펭귄',
                style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                // 바다 코끼리와 위로 보관함 사이 여백 박스
                height: 0.1.sh,
              ),
              getButton(
                hint: "위로 보관함",
                nextPage: const StoragePage(),
              ),
              SizedBox(
                height: 0.03.sh,
              ),
              getButton(hint: "나의 고민 보관함", nextPage: const Worry_StoragePage()),
              SizedBox(
                height: 0.03.sh,
              ),
              getButton(hint: "임시 보관함", nextPage: const Temporay_StoragePage()),
              const MasterKey(margin: 50)
            ],
          ),
        ),
      ),
    );
  }
}
