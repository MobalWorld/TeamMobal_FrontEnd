import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobalworld/src/Front/Color_UI/padding.dart';
import 'package:mobalworld/src/Front/Setting/bottomNav.dart';
import 'package:provider/provider.dart';

import '../Appbar page/storage_3/temporary_storage.dart';
import '../Group/group_main.dart';
import '../Group/group_select.dart';
import '../Setting/bottom.dart';
import '../Setting/theme_provider.dart';

class TemporaryWrite extends StatefulWidget {
  const TemporaryWrite({super.key});

  @override
  State<TemporaryWrite> createState() => _TemporaryWriteState();
}

class _TemporaryWriteState extends State<TemporaryWrite> {
  String title = '';
  String content = '';
  String group = "23-1 한동위로팀";
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Scaffold(
      backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFEFF0F2),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: AppBar(
          backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFEFF0F2),
          toolbarHeight: 75,
          // 취소 버튼
          leading: Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 100,
              child: TextButton(
                child: Text(
                  '취소',
                  style: TextStyle(fontSize: 15,color: Color(0xFFED7D79)),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFEFF0F2),
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: isDarkMode ? Color(0xFF161817) : Color(0xFFEFF0F2),
                        ),
                        height: 0.3.sh,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 0.1.sh,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(isDarkMode ? Color(0xFF161817) : Color(0xFFEFF0F2)),
                                  elevation:
                                      MaterialStateProperty.all<double>(0),
                                ),
                                onPressed: () {
                                  Get.back();
                                  Get.back();
                                },
                                child: Text(
                                  '작성취소',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 0.1.sh,
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all( isDarkMode ? Color(0xFF161817) : Color(0xFFEFF0F2)),
                                  elevation:
                                      MaterialStateProperty.all<double>(0),
                                ),
                                onPressed: () {
                                  _showDialog(context,isDarkMode);
                                },
                                child: Text(
                                  '임시저장',
                                  style: TextStyle(color: Colors.blue[300]),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 0.1.sh,
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(isDarkMode ? Color(0xFF161817) : Color(0xFFEFF0F2)),
                                  elevation:
                                      MaterialStateProperty.all<double>(0),
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text(
                                  '취소',
                                  style: TextStyle(
                                      color: isDarkMode ? Colors.white : Colors.black, fontSize: 14.sp),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          centerTitle: true,

          title: Text(
            group,
            style: TextStyle(fontSize: 25,color: isDarkMode ? Colors.white : Colors.black),
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              child: Text(
                '등록',
                style: TextStyle(color : isDarkMode? Colors.white : Colors.black , fontSize: 15.sp),
              ),
              onPressed: () {
                Get.to(BottomNavi());
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: GetPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: '쓰다만 글이지롱',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: isDarkMode ? Colors.white : Colors.black.withOpacity(0.4)), // 포커스될 때 테두리 색상
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: isDarkMode ? Colors.white : Colors.black.withOpacity(0.4)), // 포커스될 때 테두리 색상
                    ),
                hintStyle: TextStyle(color: isDarkMode ? Colors.white.withOpacity(0.4): Colors.black.withOpacity(0.4))),
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                    labelText: '고민 내용', alignLabelWithHint: true,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: isDarkMode ? Colors.white : Colors.black.withOpacity(0.4)), // 포커스될 때 테두리 색상
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: isDarkMode ? Colors.white : Colors.black.withOpacity(0.4)), // 포커스될 때 테두리 색상
                    ),
                    labelStyle: TextStyle(color: isDarkMode ? Colors.white.withOpacity(0.4): Colors.black.withOpacity(0.4))),
                onChanged: (value) {
                  setState(() {
                    content = value;
                  });
                },
                maxLines: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context, bool isDarkMode) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('임시 저장', style: TextStyle(color : isDarkMode ? Colors.white : Colors.black)),
        content: Text('임시 저장됩니다.', style: TextStyle(color : isDarkMode ? Colors.white : Colors.black)),
        actions: [
          TextButton(
            onPressed: () {
              Get.offAll(() => BottomNavi());
            },
            child: Text('확인', style: TextStyle(color : isDarkMode ? Colors.white : Colors.black)),
          ),
        ],
      );
    },
  );
}

