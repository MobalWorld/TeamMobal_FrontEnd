import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Group/group_select.dart';
import 'bottom.dart';
// import 'setting.dart';

class WorryWriting extends StatefulWidget {
  const WorryWriting({super.key});

  @override
  State<WorryWriting> createState() => _WorryWritingState();
}

class _WorryWritingState extends State<WorryWriting> {
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
          leading: TextButton(
            child: Text(
              '취소',
              style: TextStyle(color: Colors.black, fontSize: 14.sp),
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
                              elevation: MaterialStateProperty.all<double>(0),
                            ),
                            onPressed: () {
                              Get.to(GroupSelect());
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
                              elevation: MaterialStateProperty.all<double>(0),
                            ),
                            onPressed: () {
                              // Get.to(Setting());
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
                              elevation: MaterialStateProperty.all<double>(0),
                            ),
                            onPressed: () {
                              Get.to(WorryWriting());
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
                Navigator.pop(context);
              },
              //   showModalBottomSheet(
              //     context: context,
              //     builder: (BuildContext context) {
              //       return Container(
              //         color: Colors.white,
              //         height: 0.3.sh,
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             SizedBox(
              //               width: double.infinity,
              //               height: 0.1.sh,
              //               child: ElevatedButton(
              //                 style: ButtonStyle(
              //                   backgroundColor:
              //                       MaterialStateProperty.all(Colors.white),
              //                   elevation: MaterialStateProperty.all<double>(0),
              //                 ),
              //                 onPressed: () {
              //                   Get.to(GroupSelect());
              //                 },
              //                 child: Text(
              //                   '작성취소',
              //                   style: TextStyle(color: Colors.red),
              //                 ),
              //               ),
              //             ),
              //             SizedBox(
              //               height: 0.1.sh,
              //               width: double.infinity,
              //               child: ElevatedButton(
              //                 style: ButtonStyle(
              //                   backgroundColor:
              //                       MaterialStateProperty.all(Colors.white),
              //                   elevation: MaterialStateProperty.all<double>(0),
              //                 ),
              //                 onPressed: () {
              //                   // Get.to(Setting());
              //                 },
              //                 child: Text(
              //                   '임시저장',
              //                   style: TextStyle(color: Colors.blue[300]),
              //                 ),
              //               ),
              //             ),
              //             SizedBox(
              //               height: 0.1.sh,
              //               width: double.infinity,
              //               child: ElevatedButton(
              //                 style: ButtonStyle(
              //                   backgroundColor:
              //                       MaterialStateProperty.all(Colors.white),
              //                   elevation: MaterialStateProperty.all<double>(0),
              //                 ),
              //                 onPressed: () {
              //                   Get.to(WorryWriting());
              //                 },
              //                 child: Text(
              //                   '취소',
              //                   style: TextStyle(
              //                       color: Colors.black, fontSize: 14.sp),
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       );
              //     },
              //   );
              // },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 0.03.sh, vertical: 0.02.sh),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: '제목',
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
