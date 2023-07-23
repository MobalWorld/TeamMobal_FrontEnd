import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobalworld/src/Front/Color_UI/padding.dart';

//import 'package:mobalworld/src/ui/Setting/main_loading.dart';

import '../login/add_google_info.dart';
import '../login/login.dart';
import '../Setting/master_key.dart';

class JoinMakePage extends StatefulWidget {
  const JoinMakePage({Key? key}) : super(key: key);

  @override
  State<JoinMakePage> createState() => _JoinMakePageState();
}

class _JoinMakePageState extends State<JoinMakePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            // 전체 패딩 값 - 함수로 불러와서 쓰기
            padding: GetPadding(),
            child: Column(
              children: [
                SizedBox(
                  height: 0.2.sh,
                ),
                Container(
                    child: Icon(
                  Icons.water_drop_outlined,
                  size: 0.2.sh,
                  color: Color(0xFFFCCAA9),
                )),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: const Text(
                    '편지의 마음',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.1.sh,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF8E8),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '편지함을 만들고 싶나요?',
                            style: TextStyle(
                                fontSize: 20,),
                          ),
                          SizedBox(
                            height: 90,
                          )
                        ],
                      ),
                      Container(
                        child: Transform.translate(
                          offset: Offset(0, 40),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          GoogleAdditionalPage()));
                            },
                            child: Text(
                              '만들기',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                 ),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xFFFCCAA9),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 0.01.sh,
                ),
                Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF8E8),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    // 컨테이너의 차일드
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '편지함을 주소를 알고 있나요?',
                              style: TextStyle(
                                  fontSize: 20,),
                            ),
                            SizedBox(
                              height: 90,
                            )
                          ],
                        ),
                        Container(
                          child: Transform.translate(
                            offset: Offset(0, 40),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        //!!!이 아래 LoginPage()가 아니라 그룹 코드 작성하는 페이지로 이동해야함!!!
                                        builder: (context) => LoginPage()));
                              },
                              child: Text(
                                '참여하기',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                   ),
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xFFFCCAA9),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                MasterKey(margin: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
