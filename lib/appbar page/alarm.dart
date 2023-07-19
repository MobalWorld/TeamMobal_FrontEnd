
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobalworld/src/ui/bottom.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
      PreferredSize( //appbar 높이 조절
        preferredSize: Size.fromHeight( 75.0, ),

        child: AppBar(
          toolbarHeight: 75,
          backgroundColor: Colors.white,

          //뒤로가기 버튼
          leading: Row(
            children: [
              IconButton(
                color: Colors.black,
                icon: Icon(Icons.arrow_back_ios_new),

                // 추후에 이동 기능 추가하기
                onPressed: () {},
              ),
            ],
          ),
          centerTitle: true,
          title: Text("알림",
            textAlign: TextAlign.center,
            style:TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 25,
              color: Colors.black, ),
          ),
        ),),


      /////body - 리스트 시작
      body: ListView(
        padding: //패딩 통일해서 위젯으로 사용하자는 말 나왓엇음, 어떻게 할건지 상의하기
        EdgeInsets.symmetric(
            horizontal: 0.005.sh, //일단 내가 임의로 바꿈
            vertical: 0.04.sh
        ),

        children: <Widget>[ SingleChildScrollView( // 스크롤 가능하게
          child:Column(
            children: [

              // 알림 1st
              ListTile(
                dense: false,
                // 고민 글 제목 + 에 대한 위로가 도착
                title: Text("행복하고 싶다에 대한 위로가 도착했습니다.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                // 고민글이 작성된 해당 페이지 이름
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("23-1 한동 위로 팀",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text("2023/07/18",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),


                // 알림 날짜 작성 - 3번째 줄

                visualDensity: VisualDensity( // listview에서 각 항목 들의 여백
                    vertical: 0,
                    horizontal: 0),

                // 맨 앞에 오는 그룹의 프로필 이미지 (고민 글이 작성된 그룹)
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/hgu.png'),
                  radius: 25, //프로필 사진 원 사이즈 -> 30으로 고정
                ),

              ),
              // 각 팀 타일 사이에 구분선 추가
              Divider(
                thickness: 2,
              ),

              //리스트 타일 사이에 여백 한번 만들어봄
              SizedBox(
                height: 4,
              ),



              // 알림 2nd
              ListTile(
                dense: false,
                // 고민 글 제목 + 에 대한 위로가 도착
                title: Text("푸바오 없인 못살아에 대한 위로가 도착했습니다.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                // 고민글이 작성된 해당 페이지 이름
                subtitle:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("푸바오 사랑해 팀",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text("2023/07/15",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),

                // 알림 날짜 작성 - 3번째 줄

                visualDensity: VisualDensity( // listview에서 각 항목 들의 여백
                    vertical: 0,
                    horizontal: 0),

                // 맨 앞에 오는 그룹의 프로필 이미지 (고민 글이 작성된 그룹)
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/fubao.webp'),
                  radius: 25, //프로필 사진 원 사이즈 -> 30으로 고정
                ),

              ),

              // 각 팀 타일 사이에 구분선 추가
              Divider(
                thickness: 2,
              ),
            ],
          ),

          // 새로운 리스트 항목 넣기


        ),
        ],),
      bottomNavigationBar: bottomWidget(),
    );
  }
}