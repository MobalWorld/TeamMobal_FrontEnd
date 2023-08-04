import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../Appbar page/alarm.dart';
import '../../Appbar page/storage_3/storagebox_btn.dart';
import '../../Group/group_select.dart';
import '../bottom.dart';
import '../bottomNav.dart';
import '../theme_provider.dart';
import 'changeNickname.dart';


var _nickName = '남극 펭귄';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

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
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Scaffold(
      backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFEFF0F2),
      appBar: AppBar(
        backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFEFF0F2),
        automaticallyImplyLeading: false,
        title: Text(
          '마이페이지',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
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
              ),
            ),
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
                      style: TextStyle(fontSize: 17,color: isDarkMode ? Colors.white : Colors.black,),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: IconButton(
                      onPressed: () {
                        Get.to(const ChangeProfil());
                      },
                      icon: Icon(Icons.edit,color: isDarkMode ? Colors.white : Colors.black,),
                      style: const ButtonStyle(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.02.sh),
              child: Divider(
                height: 10,
                color: isDarkMode? Colors.white : Colors.black,
                thickness: 1,
              ),
            ),
            Expanded(
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  // !!!!!!! nextPage 나중에 만들면 바꾸기 !!!!!!!
                  getSetting(hint: "계정 정보", nextPage: BottomNavi(),isDarkMode: isDarkMode),
                  getSetting(hint: "버전", nextPage: BottomNavi(),isDarkMode: isDarkMode),
                  getSetting(hint: "문의하기", nextPage: BottomNavi(),isDarkMode: isDarkMode),
                  getDark(), // 다크모드 토글을 위해 nextPage를 전달하지 않습니다.
                  // Add more settings options as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  EdgeInsets GetPadding() => EdgeInsets.symmetric(vertical: 0.02.sh);
}

Widget getDark() {
  return Consumer<ThemeProvider>(
    builder: (context, themeProvider, _) {
      return SwitchListTile(
        title: const Text('다크 모드'),
        value: themeProvider.isDarkMode,
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Colors.grey,
        activeColor: Colors.black,
        activeTrackColor: Colors.white,
        onChanged: (bool value) {
          themeProvider.toggleTheme();
        },
      );
    },
  );
}

ListTile getSetting({required String hint, required Widget nextPage, required bool isDarkMode}) {
  return ListTile(
    title: Text(
      hint,
      style: const TextStyle(fontSize: 17),
    ),
    trailing: Icon(Icons.arrow_forward_ios_rounded, color: isDarkMode ? Colors.white : Colors.black),
    onTap: () {
      Get.to(nextPage);
    },
  );
}
