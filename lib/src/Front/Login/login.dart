import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../../../home/home.dart';
import '../../../main.dart';

import '../Color_UI/padding.dart';
import '../Setting/master_key.dart';
import '../Setting/theme_provider.dart';
import 'add_google_info.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<String> dropdownOptions = ['home', 'login', 'loading'];
  late String selectedOption;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth anonAuth = FirebaseAuth.instance;
  late Email emailing;

  get routeNames => null;

  Future signInAnon(FirebaseAuth auth) async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
      var user = await auth.currentUser;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<User?> _signInWithGoogle(FirebaseAuth auth) async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
      await auth.signInWithCredential(credential);
      final User? user = userCredential.user;
      return user;
    }
    return null;
  }

  Future<void> _checkUser(String email) async {
    final usersRef = await FirebaseFirestore.instance.collection('user');
    QuerySnapshot querySnapshot =
    await usersRef.where('Email', isEqualTo: email).limit(1).get();

    // 쿼리 결과 확인
    if (querySnapshot.docs.length > 0) {
      // 동일한 이메일을 가진 문서가 존재하는 경우
      for (DocumentSnapshot doc in querySnapshot.docs) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    } else {
      // 일치하는 문서가 없는 경우
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            title: Text(
              '알림',
            ),
            content: Text(
              '로그인을 위해 추가 정보를 입력해 주세요.',
            ),
            actions: [
              TextButton(
                child: Text(
                  '예',
                ),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GoogleAdditionalPage()),
                    );
                  });
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    emailing = Provider.of<Email>(context);
    return Scaffold(
      backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFFBF9F4),
      body: SafeArea(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 0.2.sh,
                ),

                Container(
                    child: Icon(
                      Icons.water_drop_outlined,
                      size: 0.2.sh,
                      color: Color(0xFFFF6105),
                    ),
                ),

                SizedBox(
                  height: 0.02.sh,
                ),

                Container(
                  alignment: Alignment.bottomCenter,
                  child: const Text(
                    '편지의 마음',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Yeongdeok Blueroad",
                    ),
                  ),
                ),

                SizedBox(
                  height: 0.05.sh,
                ),
              ],
            ),

            SizedBox(
              height: 0.05.sh,
            ),


            Center(
              child: ElevatedButton(
                // 버튼 스타일 지정
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  fixedSize: Size(0.35.sh, 0.02.sh),

                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.login
                    ),

                    Text('Google 계정으로 로그인',
                      style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w400),),
                  ],
                ),
                onPressed: () async {
                  final FirebaseAuth googleAuth = FirebaseAuth.instance;
                  final User? user = await _signInWithGoogle(googleAuth);
                  if (user != null) {
                    emailing.add(user.email.toString());
                    _checkUser(user.email.toString());
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          title: Text(
                            '알림',
                          ),
                          content: Text(
                            '로그인 실패!',
                          ),
                          actions: [
                            TextButton(
                              child: Text(
                                '예',
                              ),
                              onPressed: () {
                                setState(() {
                                  Navigator.pop(context);
                                });
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ),
            MasterKey(margin: 100)
          ],
        ),
      ),
    );
  }
}
