import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobalworld/src/ui/Group/group_manage.dart';

import '../bottom.dart';
import 'Settings.dart';
import 'selectImage.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
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
          onPressed: () {},
          color: Colors.black,
        ),
        title: Text(
          '프로필',
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(vertical: 0.02.sh),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    'assets/walrus.png',
                  ),
                  radius: 40,
                )),
            Text(
              "바다 코끼리",
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.02.sh),
              child: Divider(
                height: 10,
                color: Colors.black,
                thickness: 1,
              ),
            ),
            Expanded(
              child: ListView(
                physics: AlwaysScrollableScrollPhysics(),
                children: [
                  ListTile(
                    title: Text(
                      "설정",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                    onTap: () {
                      Get.to(Settings());
                    },
                  ),
                  ListTile(
                    title: Text(
                      "닉네임 변경",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                    onTap: () {
                      Get.to(Settings());
                    },
                  ),
                  ListTile(
                    title: Text(
                      "프로필 사진 변경",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                    onTap: () {
                      Get.to(SelectImage());
                    },
                  ),
                  ListTile(
                    title: Text(
                      "그룹 관리",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                    onTap: () {
                      Get.to(
                        // 그룹 관리 페이지 이동으로 바꿔주기
                          GroupManage()
                      );
                    },
                  ),
                  // Add more settings options as needed
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomWidget(),
    );
  }
}

ListTile getSetting({
  required String hint,
}) {
  return ListTile(
    title: Text(
      hint,
      style: TextStyle(fontSize: 15, color: Colors.black),
    ),
    trailing: Icon(Icons.arrow_forward_ios_rounded),
    onTap: () {
      Get.toNamed('next');
    },
  );
}
