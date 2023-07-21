import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bottom.dart';

enum Item { delete }

class GroupSelect extends StatefulWidget {
  const GroupSelect({super.key});

  @override
  State<GroupSelect> createState() => _GroupSelectState();
}

class _GroupSelectState extends State<GroupSelect> {
  Item? selectedMenu;
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

          leading: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/peng1.jpg'),
                radius: 20, //프로필 사진 원 사이즈
              ),
            ),
          ),
          title: Row(
            children: [
              //나중에 회원 이름 data 넣기
              Text(
                "안녕하세요 남극펭귄님",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 21,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          // 우측 아이콘 - 알림 기능
          actions:[
            IconButton(onPressed: () {},
                icon: Icon(Icons.notifications,
                  color: Colors.black, size: 30,
                )
            ),
          ],
          centerTitle: true,), ),

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

              // 23-1 한동 위로 팀
              ListTile(
                dense: false,
                title: Text("23-1 한동 위로 팀",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                subtitle: Text("참여자 : 5명",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ), //참여자 명수 변수 받아

                visualDensity: VisualDensity( // listview에서 각 항목 들의 여백
                    vertical: 0,
                    horizontal: 0),

                // 맨 앞에 오는 그룹의 프로필 이미지
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/images/hgu.png'),
                  radius: 30, //프로필 사진 원 사이즈 -> 30으로 고정
                ),
                //맨 우측에 오는 ... 버튼
                trailing: PopupMenuButton<Item>(
                  icon: Icon(Icons.more_horiz),
                  initialValue: selectedMenu,
                  // Callback that sets the selected popup menu item.
                  onSelected: (Item item) {
                    setState(() {
                      selectedMenu = item;
                    });
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<Item>>[
                    PopupMenuItem<Item>(
                      value: Item.delete,
                      child: Text('삭제'),

                    ),
                  ],
                ),
              ),
              // 각 팀 타일 사이에 구분선 추가
              Divider(
                thickness: 2,
              ),
              // 푸바오 사랑해 팀
              ListTile(
                dense: false,
                title: Text("푸바오 사랑해 팀",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                subtitle: Text("참여자 : 125명",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ), //참여자 명수 변수 받아

                visualDensity: VisualDensity( // listview에서 각 항목 들의 여백
                    vertical: 0,
                    horizontal: 0),

                // 맨 앞에 오는 그룹의 프로필 이미지
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/images/fubao.webp'),
                  radius: 30, //프로필 사진 원 사이즈 -> 30으로 고정
                ),
                //맨 우측에 오는 ... 버튼
                trailing: PopupMenuButton<Item>(
                  icon: Icon(Icons.more_horiz),
                  initialValue: selectedMenu,
                  // Callback that sets the selected popup menu item.
                  onSelected: (Item item) {
                    setState(() {
                      selectedMenu = item;
                    });
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<Item>>[
                    PopupMenuItem<Item>(
                      value: Item.delete,
                      child: Text('삭제'),

                    ),
                  ],
                ),
              ),

              // 각 팀 타일 사이에 구분선 추가
              Divider(
                thickness: 2,
              ),

              // 사랑아 시선해 팀
              ListTile(
                dense: false,
                title: Text("사랑아 시선해 팀",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                subtitle: Text("참여자 : 15명",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ), //참여자 명수 변수 받아

                visualDensity: VisualDensity( // listview에서 각 항목 들의 여백
                    vertical: 0,
                    horizontal: 0),

                // 맨 앞에 오는 그룹의 프로필 이미지
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/images/peng2.jpg'),
                  radius: 30, //프로필 사진 원 사이즈 -> 30으로 고정
                ),
                //맨 우측에 오는 ... 버튼
                trailing: PopupMenuButton<Item>(
                  icon: Icon(Icons.more_horiz),
                  initialValue: selectedMenu,
                  // Callback that sets the selected popup menu item.
                  onSelected: (Item item) {
                    setState(() {
                      selectedMenu = item;
                    });
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<Item>>[
                    PopupMenuItem<Item>(
                      value: Item.delete,
                      child: Text('삭제'),

                    ),
                  ],
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