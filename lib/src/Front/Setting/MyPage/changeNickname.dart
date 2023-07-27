import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../Color_UI/padding.dart';

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
          toolbarHeight: 80,
          leading: TextButton(
            child: Text("취소"),
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
