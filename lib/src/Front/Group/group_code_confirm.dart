import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../Setting/theme_provider.dart';
import 'group_select.dart';

class GroupCodeConfirm extends StatelessWidget {
  const GroupCodeConfirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return Scaffold(
      appBar: PreferredSize(
        //appbar 높이 조절
        preferredSize: Size.fromHeight(
          75.0,
        ),

        child: AppBar(
          toolbarHeight: 75,

          //뒤로가기 버튼
          leading: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios_new,color: isDarkMode? Colors.white : Colors.black,),

                // 추후에 이동 기능 추가하기
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          centerTitle: true,
          title: Text(
            "편지함 만들기",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  Text(
                    "그룹코드",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                       ),
                  ),
                  //간격 여백
                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: isDarkMode? Color(0xFF242625) : Colors.white,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35,vertical: 5),
                      child: Text(
                        "1 2 3 4",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode? Colors.white : Colors.black

                        ),
                      ),
                    ),
                  ),

                  //간격 여백
                  SizedBox(
                    height: 40,
                  ),

                  //코드 복사하기 버튼
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(160,40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor:
                            isDarkMode? Color(0xFF242625) : Colors.white),
                    onPressed: () {
                      //코드 복사 되었을 경우 하단부에 알림
                      final snackBar = SnackBar(
                        content: Text('✅ 그룹 코드가 복사되었습니다!',style: TextStyle(
                          color: isDarkMode? Colors.white :Colors.black,
                        ),),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '코드 복사하기',
                          style: TextStyle(
                            color: isDarkMode? Colors.white : Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 5,),
                        FaIcon(FontAwesomeIcons.solidCopy,color: isDarkMode? Colors.white : Colors.black,),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  //코드 공유하기 버튼
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(160,40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor:
                        isDarkMode? Color(0xFF242625) : Colors.white),
                    onPressed: () {
                      // 코드 공유하는 버튼
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '코드 공유하기',
                          style: TextStyle(
                            color: isDarkMode? Colors.white : Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 5,),
                        FaIcon(FontAwesomeIcons.solidShareFromSquare,color: isDarkMode? Colors.white : Colors.black),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  //확인 버튼
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4880EE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                    onPressed: () {
                      Get.to(
                        GroupSelect(),
                      );
                    },
                    child: Text(
                      '확인',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 55,
                  ),
                ],
              ),
            ),
            
          ],
          
        ),
        
      ),
    );
  }
}
