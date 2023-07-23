import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
<<<<<<< HEAD

import '../Group/group_main.dart';
=======
import 'package:mobalworld/src/Front/Color_UI/padding.dart';
import '../appbar page/storage_3/storagebox_btn.dart';
>>>>>>> 8fdd0c739d277588e458dce258f5e351a4a856ae
import '../Setting/bottom.dart';

class WiroWriting extends StatefulWidget {
  const WiroWriting({Key? key}) : super(key: key);

  @override
  State<WiroWriting> createState() => _WiroWritingState();
}

class _WiroWritingState extends State<WiroWriting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: AppBar(
          toolbarHeight: 75,
          backgroundColor: Colors.white,
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
                                onPressed: () {},
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
                                  Navigator.pop(context);
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
          title: Text('위로 작성하기'),
          actions: [
            TextButton(
              child: Text(
                '등록',
                style: TextStyle(color: Colors.red[400], fontSize: 15.sp),
              ),
              onPressed: () {
                _showDialog2(context);
              },
            ),
=======
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Get.to(Storagebox());
          },
          color: Colors.black,
        ),
        title: Column(
          children: [
            Text('2023년 07월 11일'),
            Text('23-1 한동 위로팀',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                )),
>>>>>>> 8fdd0c739d277588e458dce258f5e351a4a856ae
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: GetPadding(),
          child: Column(
            children: [
              SizedBox(
                height: 0.05.sh,
              ),
              Center(
                child: Column(
                  children: [
                    // 위로가 위에 있게 배치
                    ExpansionTile(
                      // Define the collapsed and expanded background color
                      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                      // Define the collapsed and expanded shape
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      // The title displayed when the container is collapsed
                      title: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage('assets/images/deer.jpg'),
                          ),
                          SizedBox(width: 0.01.sh),
                          Text(
                            '고민자 닉네임',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      // The content displayed when the container is expanded
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start, // Align children to the left
                              children: [
                                Text('고민 제목',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),), // Align to the left
                                Text('고민 내용',style: TextStyle(fontSize: 16),), // Align to the left
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),


                    SizedBox(
                      height: 0.02.sh,
                    ),

                    //여기에 붙여넣기 - 나의 고민
                    Container(
                      height: 0.3.sh,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.02.sh, vertical: 0.01.sh),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        TextField(
                        decoration: InputDecoration(
                        labelText: '제목',
                        ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: '내용',
                          ),
                          maxLines: 1,
                        )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomWidget(),
    );
  }
}
