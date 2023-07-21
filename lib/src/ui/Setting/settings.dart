import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bottom.dart';
import 'myPage.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Get.to(MyPage());
          },
          color: Colors.black,
        ),
        title: Text(
          '설정',
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: AlwaysScrollableScrollPhysics(),
                children: [
                  ListTile(
                    title: Text(
                      "계정 정보",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                    onTap: () {
                      //Get.to(Settings());
                    },
                  ),
                  ListTile(
                    title: Text(
                      "알람",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                    onTap: () {
                      //Get.to(Settings());
                    },
                  ),
                  ListTile(
                    title: Text(
                      "다크모드",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                    onTap: () {
                      //Get.to(Settings());
                    },
                  ),
                  ListTile(
                    title: Text(
                      "버전",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                    onTap: () {
                      //Get.to(Settings());
                    },
                  ),
                  ListTile(
                    title: Text(
                      "문의하기",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                    onTap: () {
                      //Get.to(Settings());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
