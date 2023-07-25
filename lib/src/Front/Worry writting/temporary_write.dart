import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobalworld/src/Front/Color_UI/padding.dart';

import '../Appbar page/storage_3/temporary_storage.dart';
import '../Group/group_main.dart';
import '../Group/group_select.dart';
import '../Setting/bottom.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: AppBar(
          toolbarHeight: 75,
          backgroundColor: Colors.white,
          // 취소 버튼
          leading: Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 100,
              child: TextButton(
                child: Text(
                  '취소',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        color: Colors.white,
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
                                      MaterialStateProperty.all(Colors.white),
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
                                      MaterialStateProperty.all(Colors.white),
                                  elevation:
                                      MaterialStateProperty.all<double>(0),
                                ),
                                onPressed: () {
                                  _showDialog(context);
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
                                      MaterialStateProperty.all(Colors.white),
                                  elevation:
                                      MaterialStateProperty.all<double>(0),
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text(
                                  '취소',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14.sp),
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
            style: TextStyle(color: Colors.black, fontSize: 25),
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              child: Text(
                '등록',
                style: TextStyle(color: Colors.red[400], fontSize: 15.sp),
              ),
              onPressed: () {
                Get.to(GroupMain());
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
                  labelText: '제목 : 쓰다만 글이지롱 ',
                ),
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                    labelText: '고민 내용', alignLabelWithHint: true),
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
      bottomNavigationBar: bottomWidget(),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('임시 저장'),
        content: Text('임시 저장되었습니다.'),
        actions: [
          TextButton(
            onPressed: () {
              Get.to(GroupMain()); // Close the dialog
            },
            child: Text('확인'),
          ),
        ],
      );
    },
  );
}
