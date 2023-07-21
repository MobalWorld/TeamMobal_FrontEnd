import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../bottom.dart';
import 'changeNickname.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

var _nickName = "바다코끼리";

class _MyPageState extends State<MyPage> {
  File? _image;
  

  Future<void> _pickImageFromGallery() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      }
    });
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
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
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
                child: IconButton(
                  iconSize: 70,
                  icon: _image == null
                      ? CircleAvatar(

                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(
                      'assets/images/walrus.png',
                    ),
                    radius: 70,
                  )

                      : CircleAvatar(
                    backgroundImage: FileImage(
                      _image!,
                    ),
                    radius: 70,
                  ), // Display the selected image
                  onPressed: () {
                    _pickImageFromGallery();
                  },
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.02.sh),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: Text(
                      _nickName,
                      style: TextStyle(fontSize: 17, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: IconButton(
                      onPressed: () {
                        Get.to(ChangeNickName());
                      },
                      icon: Icon(Icons.edit),
                      style: ButtonStyle(),
                    ),
                  )
                ],
              ),
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
                  getSetting(hint: "계정 정보", nextPage: MyPage()),
                  getSetting(hint: "그룹 관리", nextPage: MyPage()),
                  getSetting(hint: "다크모드", nextPage: MyPage()),
                  getSetting(hint: "버전", nextPage: MyPage()),
                  getSetting(hint: "문의하기", nextPage: MyPage()),
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

ListTile getSetting({required String hint, required Widget nextPage}) {
  return ListTile(
    title: Text(
      hint,
      style: TextStyle(fontSize: 17, color: Colors.black),
    ),
    trailing: Icon(Icons.arrow_forward_ios_rounded),
    onTap: () {
      Get.to(nextPage);
    },
  );
}