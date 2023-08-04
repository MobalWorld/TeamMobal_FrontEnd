import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../Color_UI/padding.dart';
import '../theme_provider.dart';

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
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Scaffold(
      backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFFBF9F4),
      appBar: AppBar(
          backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFFBF9F4),
          toolbarHeight: 80,
          leading: TextButton(
            child: Text("취소",style: TextStyle(color: isDarkMode ? Colors.white : Colors.black,),),
            onPressed: () {
              Get.back();
            },
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: GetPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
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
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: Icon(
                        Icons.add_a_photo,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: '닉네임',
                  labelStyle: TextStyle(color: isDarkMode ? Colors.white : Colors.black,),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: isDarkMode ? Colors.white : Colors.black), // 포커스될 때 테두리 색상
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: isDarkMode ? Colors.white : Colors.black), // 포커스될 때 테두리 색상
                  ),
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
