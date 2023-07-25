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

var _nickName = '남극 펭귄';

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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          '마이페이지',
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
                padding: GetPadding(),
                child: IconButton(
                  iconSize: 70,
                  icon: _image == null
                      ? const CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(
                            'assets/images/peng1.jpg',
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
                  const SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: Text(
                      _nickName,
                      style: const TextStyle(fontSize: 17, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: IconButton(
                      onPressed: () {
                        Get.to(const ChangeProfil());
                      },
                      icon: const Icon(Icons.edit),
                      style: const ButtonStyle(),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.02.sh),
              child: const Divider(
                height: 10,
                color: Colors.black,
                thickness: 1,
              ),
            ),
            Expanded(
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  getSetting(hint: "계정 정보", nextPage: const MyPage()),
                  getSetting(hint: "그룹 관리", nextPage: const MyPage()),
                  getSetting(hint: "버전", nextPage: const MyPage()),
                  getSetting(hint: "문의하기", nextPage: const MyPage()),
                  getDark(hint: "다크 모드", nextPage: const MyPage()),
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

  EdgeInsets GetPadding() => EdgeInsets.symmetric(vertical: 0.02.sh);

  bool _lights = false; // 다크 모드 꺼져있음
  //getDark 다크모드 토글 적용
  Widget getDark({required String hint, required Widget nextPage}) {
    return SwitchListTile(
      title: const Text('다크 모드'),
      value: _lights,
      onChanged: (bool value) {
        setState(() {
          _lights = value;
        });
      },
    );
  }
}

ListTile getSetting({required String hint, required Widget nextPage}) {
  return ListTile(
    title: Text(
      hint,
      style: const TextStyle(fontSize: 17, color: Colors.black),
    ),
    trailing: const Icon(Icons.arrow_forward_ios_rounded),
    onTap: () {
      Get.to(nextPage);
    },
  );
}
