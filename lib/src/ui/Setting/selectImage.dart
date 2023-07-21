import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'myPage.dart';

class SelectImage extends StatefulWidget {
  const SelectImage({super.key});

  @override
  State<SelectImage> createState() => _SelectImageState();
}

class _SelectImageState extends State<SelectImage> {
  File? _image;

  Future<void> _pickImageFromGallery() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          '프로필 사진 변경',
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: _image == null
                ? Text('No Image Selected')
                : CircleAvatar(
                    backgroundImage: FileImage(
                      _image!,
                    ),
                    radius: 70,
                  ), // Display the selected image
          ),
          ElevatedButton(
              onPressed: () {
                _pickImageFromGallery();
              },
              child: Icon(
                Icons.photo_library,
                color: Colors.white,
                size: 30,
              ))
        ],
      ),
    );
  }
}
