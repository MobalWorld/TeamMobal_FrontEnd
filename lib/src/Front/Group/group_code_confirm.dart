import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';
import '../../Otp/otp.dart';
import '../Setting/theme_provider.dart';
import 'group_select.dart';

class GroupCodeConfirm extends StatefulWidget {
  const GroupCodeConfirm({Key? key}) : super(key: key);

  @override
  State<GroupCodeConfirm> createState() => _GroupCodeConfirmState();
}
class _GroupCodeConfirmState extends State<GroupCodeConfirm> {

  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();

  String? _otp;
  bool matched = false;

  Future<void> _checkCode(
      String code, String email) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('groups')
        .where('code', isEqualTo: code)
        .limit(1)
        .get();

    if(querySnapshot.size == 1)
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            backgroundColor: Color(0xFfF8ECE2),
            title: Text('알림',
              style: TextStyle(
                  fontFamily: 'gangwon',
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  //color: Color(0xFF746553),
                  color: Color(0xFF3C3731)

              ),),
            content: Text("그룹가입 성공!",
              style: TextStyle(
                  fontFamily: 'gangwon',
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF6B5F51),
                  fontSize: 21

              ),),
            actions: [
              TextButton(
                child: Text('OK',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF746553),
                      fontSize: 18

                  ),),
                onPressed: () async {
                  FirebaseFirestore.instance
                      .collection('groups')
                      .doc(code)
                      .collection('group_users')
                      .doc(email)
                      .set({
                    'Email': email,
                    // 추가적인 필드들을 필요에 따라 여기에 추가하세요
                  });

                  FirebaseFirestore.instance
                      .collection('user')
                      .doc(email)
                      .collection('groups')
                      .doc(code)
                      .set({
                    'Email': email,
                    // 추가적인 필드들을 필요에 따라 여기에 추가하세요
                  });

                  setState(() {
                    matched = false;
                  });
                  DocumentSnapshot<Map<String, dynamic>> snapshot =
                  await FirebaseFirestore.instance.collection('groups').doc(code).get();
                  String groupName = snapshot.data()?['group_name'];

                  Navigator.of(context).pop();
                  // !!!!!!!!!!!!!!!!!!!!!!!!!!! 여기 읽어주세요!!!!!!!!!!! //
                  // 해당 그룹 페이지로 이동하면 됩니다 //
                },
              ),
            ],
          );
        },
      );
    else
      setState(() {
        matched = true;
      });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    final _email = Provider.of<Email>(context, listen: false).getEmail();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFFBF9F4),
        appBar: PreferredSize(
          //appbar 높이 조절
          preferredSize: Size.fromHeight(
            75.0,
          ),

          child: AppBar(
            backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFFBF9F4),

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
              "편지함 참여하기",
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

                    matched?Text(
                      '잘못된 그룹코드입니다!',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ):
                    Text('그룹코드를 입력해주세요'),

                    SizedBox(
                      height: 20,
                    ),

                    Container(
                      decoration: BoxDecoration(
                        color: isDarkMode? Color(0xFF242625) : Color(0xFFFBF9F4),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 35,vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OtpInput(_fieldOne, true), // auto focus
                            OtpInput(_fieldTwo, false),
                            OtpInput(_fieldThree, false),
                            OtpInput(_fieldFour, false)
                          ],
                        ),
                      ),
                    ),

                    //간격 여백
                    SizedBox(
                      height: 40,
                    ),

                    //코드 복사하기 버튼
                    SizedBox(
                      width: 0.45.sw,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
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
                              '코드 복사하기  ',
                              style: TextStyle(
                                color: isDarkMode? Colors.white : Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                            FaIcon(FontAwesomeIcons.solidCopy,color: isDarkMode? Colors.white : Colors.black,),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    //코드 공유하기 버튼
                    SizedBox(
                      width: 0.45.sw,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
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
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(width: 5,),
                            FaIcon(FontAwesomeIcons.solidShareFromSquare,color: isDarkMode? Colors.white : Colors.black),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 25,
                    ),

                    //확인 버튼
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFFC230),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                      onPressed: () {
                        setState(() {
                          _otp = _fieldOne.text +
                              _fieldTwo.text +
                              _fieldThree.text +
                              _fieldFour.text;
                          //디버그용!! 삭제하셔도 됩니다.
                        });
                        _checkCode(_otp!, _email);
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
      ),
    );
  }
}
