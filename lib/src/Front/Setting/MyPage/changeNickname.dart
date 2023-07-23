import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobalworld/src/Front/Color_UI/padding.dart';
import 'package:mobalworld/src/Front/Setting/MyPage/myPage.dart';

class ChangeNickName extends StatefulWidget {
  const ChangeNickName({super.key});

  @override
  State<ChangeNickName> createState() => _ChangeNickNameState();
}

var _nickName;

class _ChangeNickNameState extends State<ChangeNickName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 80,
          leading: TextButton(
            child: Text("취소"),
            onPressed: () {
              Get.to(MyPage());
            },
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: GetPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: '닉네임',
                ),
                onChanged: (value) {
                  setState(() {
                    _nickName = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
