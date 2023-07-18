import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class grouptselect extends StatefulWidget {
  const grouptselect({super.key});

  @override
  State<grouptselect> createState() => _grouptselectState();
}

class _grouptselectState extends State<grouptselect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar:
        PreferredSize( //appbar 높이 조절
          preferredSize: Size.fromHeight(
            75.0,
          ),
          child: AppBar(
            backgroundColor: Colors.white,
            //elevation: 0.3, // appbar 그림자 설정1
            //leading 가장 좌측 -> 회원 프로필 이미지 삽입
            leading: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/peng2.jpg'),
                  radius: 20, //프로필 사진 원 사이즈 -> 30으로 고정
                ),
                //회원 사진과 회원 인사 사이 여백
                SizedBox(
                  width: 0.02.sh,
                ),
                //나중에 회원 이름 db에서 불러와서 넣기
                Text("안녕하세요 남극펭귄님",
                  style:TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            actions:[
              IconButton(
                icon: Icon(
                  Icons.notifications, // 아이콘 지정 -> 알람 아이콘
                  size: 30.sp,
                ),
                onPressed: () {},
                color: Colors.black,
              ),
            ],

          ),
        ),

        body: SafeArea(
          child: SingleChildScrollView(
            padding: //패딩 통일해서 위젯으로 사용하자는 말 나왓엇음, 어떻게 할건지 상의하기
            EdgeInsets.symmetric(horizontal: 0.03.sh, vertical: 0.02.sh),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 0.05.sh,
                ),
                Row(
                  children: [
                    //프로필 이미지 -동그란 모양에 사진 넣어주기
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/walrus.png'),
                      radius: 30, //프로필 사진 원 사이즈 -> 30으로 고정
                    ),
                    //아래 프로필 사진이랑 그룹 이름 사이의 여백임
                    SizedBox(
                      width: 0.02.sh,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("23-1 한동 위로 팀",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text("참여자 : 5명",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ), //참여자 명수 변수 받아서 넣어줘야함
                      ],
                    ),
                    //... 버튼 제작
                    Row(
                      //이거 ...버튼 맨 끝으로 정렬시키기
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 0.1.sh, // 이것보다 좋은 여백 있으면 바꾸기 -> 자체 패딩값 적용되어있어서
                        ),
                        IconButton(onPressed:() {},
                          //누르면 창 뜨게 하기
                          icon: Icon(Icons.more_horiz),),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.005.sh, // 이것보다 좋은 여백 있으면 바꾸기 -> 자체 패딩값 적용되어있어서
                ),
                //여기 각 그룹 사이에 구분 선(Divider) 넣어줄거임
                Divider(
                  thickness: 0.3,
                  color: Colors.grey[800],
                ),
              ],
            ),
          ),
        )
    );
  }
}
