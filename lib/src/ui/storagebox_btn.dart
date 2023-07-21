import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'appbar page/storage.dart';
import 'appbar page/temporary_storage.dart';
import 'appbar page/worry_storage.dart';
import 'bottom.dart';
import 'master_key.dart';

class Storagebox extends StatefulWidget {
  const Storagebox({Key? key}) : super(key: key);

  @override
  State<Storagebox> createState() => _StorageboxState();
}

class _StorageboxState extends State<Storagebox> {
  // final beige = Color(0xffFFF8E8);
  // FCCAA9
  final beige = Color(0xff96B0E5);
  final darkTextColor = Color(0xff1F1A3D);

  //보관함에서만 작동하는 보관함 박스 button을 위젯화 - 만듦
  Widget getButton({required String hint, required Widget nextPage}) {
    return Container(
        width: double.infinity,
        // 버튼 높이
        height: Getheight(0.02.sh),
        child: ElevatedButton(
          onPressed: () {
            Get.to(nextPage);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(beige),
            foregroundColor: MaterialStateProperty.all(Colors.black),
            padding: //패딩

            MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 14.h)),

            textStyle: MaterialStateProperty.all(TextStyle(
              fontSize: FontSize(15.sp),
              fontWeight: FontWeight.w700,
            )),
            side: MaterialStateProperty.all(BorderSide(
              width: 1.0, // 테두리의 두께를 조정하세요
              color: beige, // 테두리의 색상을 원하는 색상으로 변경하세요
            )),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius:

                BorderRadius.circular(100.0), // 원하는 모서리의 둥근 정도를 조정하세요

              ),
            ),
          ),
          child: Text(hint),
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 30.sp,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 0.03.sh, vertical: 0.02.sh),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/walrus.png'),
                radius: 40,
              ),
              SizedBox(
                height: 0.015.sh,
              ),
              Text(
                '바다 코끼리',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: 0.03.sh,
              ),
              SizedBox(
                // 바다 코끼리와 위로 보관함 사이 여백 박스
                height: 0.1.sh,
              ),
              getButton(hint: "위로 보관함", nextPage: StoragePage()),
              SizedBox(
                height: 0.03.sh,
              ),
              getButton(hint: "나의 고민 보관함", nextPage: Worry_StoragePage()),
              SizedBox(
                height: 0.03.sh,
              ),
              getButton(hint: "임시 보관함", nextPage: Temporay_StoragePage()),
              MasterKey(margin: 50)
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomWidget(),
    );
  }
}