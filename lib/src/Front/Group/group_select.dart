import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobalworld/src/Front/Color_UI/padding.dart';
import 'package:mobalworld/src/Front/Group/group_make.dart';
import 'package:mobalworld/src/Front/appbar%20page/alarm.dart';
import 'package:provider/provider.dart';

import '../Setting/bottom.dart';
import '../Setting/bottomNav.dart';
import '../Setting/theme_provider.dart';
import 'group_main.dart';

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
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Scaffold(
      backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFFBF9F4),
      appBar: PreferredSize(
        //appbar 높이 조절
        preferredSize: Size.fromHeight(
          75.0,
        ),

        child: AppBar(
          backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFFBF9F4),
          toolbarHeight: 75,


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
              RichText(
                text: TextSpan(
                  text: '안녕하세요 ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: '남극 펭귄',
                      style: TextStyle(
                        fontSize: 18,
                        color: isDarkMode ? Color(0xFFFFC230) : Color(0xFFFFC230),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: '님',
                      style: TextStyle(
                        fontSize: 18,
                        color: isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // 우측 아이콘 - 알림 기능
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(AlarmPage());
                },
                icon: FaIcon(FontAwesomeIcons.solidBell, color: isDarkMode ? Colors.white : Colors.black),
            ),
          ],
          centerTitle: true,
        ),
      ),

      /////body - 리스트 시작
      body: SafeArea(
        child: ListView(
          padding: GetPadding(),
          children: [
            Column(
              children: [
                // 23-1 한동 위로 팀
                ListTile(
                  onTap: () {
                    Get.to(BottomNavi());
                  },
                  dense: false,
                  title: Text(
                    "23-1 한동 위로 팀",
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Text(
                    "참여자 : 5명",
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  //참여자 명수 변수 받아

                  visualDensity: VisualDensity(
                      // listview에서 각 항목 들의 여백
                      vertical: 0,
                      horizontal: 0),

                  // 맨 앞에 오는 그룹의 프로필 이미지
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/hgu.png'),
                    radius: 30, //프로필 사진 원 사이즈 -> 30으로 고정
                  ),
                  //맨 우측에 오는 ... 버튼
                  trailing: PopupMenuButton<Item>(
                    icon: Icon(Icons.more_horiz,color: isDarkMode ? Colors.white : Colors.black.withOpacity(0.4),),
                    initialValue: selectedMenu,
                    // Callback that sets the selected popup menu item.
                    onSelected: (Item item) {
                      setState(() {
                        selectedMenu = item;
                      });
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<Item>>[
                      PopupMenuItem<Item>(
                        value: Item.delete,
                        child: Text('삭제'),
                      ),
                    ],
                  ),
                ),
                // 각 팀 타일 사이에 구분선 추가
                Divider(
                  thickness: 1,
                  color: isDarkMode ? Colors.white.withOpacity(0.4) : Colors.black.withOpacity(0.4),
                ),
                // 푸바오 사랑해 팀
                ListTile(
                  dense: false,
                  title: Text(
                    "푸바오 사랑해 팀",
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Text(
                    "참여자 : 125명",
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  //참여자 명수 변수 받아

                  visualDensity: VisualDensity(
                      // listview에서 각 항목 들의 여백
                      vertical: 0,
                      horizontal: 0),

                  // 맨 앞에 오는 그룹의 프로필 이미지
                  leading: CircleAvatar(

                    backgroundImage: AssetImage('assets/images/fubao.webp'),
                    radius: 30, //프로필 사진 원 사이즈 -> 30으로 고정
                  ),
                  //맨 우측에 오는 ... 버튼
                  trailing: PopupMenuButton<Item>(
                    icon: Icon(Icons.more_horiz,color: isDarkMode ? Colors.white : Colors.black.withOpacity(0.4),),
                    initialValue: selectedMenu,
                    // Callback that sets the selected popup menu item.
                    onSelected: (Item item) {
                      setState(() {
                        selectedMenu = item;
                      });
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<Item>>[
                      PopupMenuItem<Item>(
                        value: Item.delete,
                        child: Text('삭제'),
                      ),
                    ],
                  ),
                ),

                // 각 팀 타일 사이에 구분선 추가
                Divider(
                  thickness: 1,
                  color: isDarkMode ? Colors.white.withOpacity(0.4) : Colors.black.withOpacity(0.4),
                ),

                // 사랑아 시선해 팀
                ListTile(
                  dense: false,
                  title: Text(
                    "사랑아 시선해 팀",
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Text(
                    "참여자 : 15명",
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  //참여자 명수 변수 받아

                  visualDensity: VisualDensity(
                      // listview에서 각 항목 들의 여백
                      vertical: 0,
                      horizontal: 0),

                  // 맨 앞에 오는 그룹의 프로필 이미지
                  leading: CircleAvatar(

                    backgroundImage: AssetImage('assets/images/peng2.jpg'),
                    radius: 30, //프로필 사진 원 사이즈 -> 30으로 고정
                  ),
                  //맨 우측에 오는 ... 버튼
                  trailing: PopupMenuButton<Item>(
                    icon: Icon(Icons.more_horiz,color: isDarkMode ? Colors.white : Colors.black.withOpacity(0.4),),
                    initialValue: selectedMenu,
                    // Callback that sets the selected popup menu item.
                    onSelected: (Item item) {
                      setState(() {
                        selectedMenu = item;
                      });
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<Item>>[
                      PopupMenuItem<Item>(
                        value: Item.delete,
                        child: Text('삭제'),
                      ),
                    ],
                  ),
                ),
                // 각 팀 타일 사이에 구분선 추가
                Divider(
                  thickness: 1,
                  color: isDarkMode ? Colors.white.withOpacity(0.4) : Colors.black.withOpacity(0.4),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: ClipOval(
        child: FloatingActionButton(
          onPressed: () {
            // Navigate to a new screen using Get
            Get.to(GroupMake());
          },
          child: FaIcon(FontAwesomeIcons.plus,color: isDarkMode? Colors.white : Colors.white,)
          ,
          backgroundColor: isDarkMode? Color(0xFFFF6105) : Color(0xFFFF6105),
        ),
      ),
    );
  }
}
