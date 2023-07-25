import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../Color_UI/padding.dart';
import 'myPage.dart';

class ChangeProfil extends StatefulWidget {
  const ChangeProfil({super.key});

  @override
  State<ChangeProfil> createState() => _ChangeProfilState();
}

var _nickName;

class _ChangeProfilState extends State<ChangeProfil> {
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
              IconButton(
                iconSize: 70,
                icon: _image == null
                    ? CircleAvatar(
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
