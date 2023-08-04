import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobalworld/src/Front/Appbar%20page/storage_3/wiro_storage.dart';
import 'package:provider/provider.dart';

import '../../Color_UI/padding.dart';
import '../../Setting/bottom.dart';
import '../../Setting/theme_provider.dart';

class StoragePage extends StatefulWidget {
  const StoragePage({super.key});

  @override
  State<StoragePage> createState() => _StoragePageState();
}

// 위로 보관함

class _StoragePageState extends State<StoragePage> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Scaffold(
      backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFEFF0F2),
      appBar: PreferredSize(
        //appbar 높이 조절
        preferredSize: Size.fromHeight(
          75.0,
        ),

        child: AppBar(
          backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFEFF0F2),
          toolbarHeight: 75,
          //뒤로가기 버튼
          leading: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios_new),
                color: isDarkMode ? Colors.white : Colors.black,
                // 추후에 이동 기능 추가하기
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          centerTitle: true,
          title: Text(
            "위로 보관함",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 23,
            ),
          ),
        ),
      ),

      /////body - 리스트 시작
      body: ListView(
        padding: //패딩 통일해서 위젯으로 사용하자는 말 나왓엇음, 어떻게 할건지 상의하기
            GetPadding(),
        children: <Widget>[
          SingleChildScrollView(
            // 스크롤 가능하게
            child: Column(
              children: [
                // 위로 1st
                ListTile(
                  onTap: () {
                    Get.to(WiroStorage());
                  },
                  dense: false,
                  // 사용자가 작성한 고민 글 제목 으로 보여주기
                  title: Text(
                    "행복하고 싶다",
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  visualDensity: VisualDensity(
                      // listview에서 각 항목 들의 여백
                      vertical: 0,
                      horizontal: 0),
                  trailing: Text(
                    "2023/07/16",
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),

                // 각 팀 타일 사이에 구분선 추가
                Divider(
                    thickness: 1,
                    color: isDarkMode ? Colors.white.withOpacity(0.4) : Colors.black.withOpacity(0.4)

                ),

                //리스트 타일 사이에 여백 한번 만들어봄
                SizedBox(
                  height: 4,
                ),

                // 위로 2nd
                ListTile(
                  dense: false,
                  // 사용자가 작성한 고민 글 제목 으로 보여주기
                  title: Text(
                    "살고 싶지 않아",
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  visualDensity: VisualDensity(
                      // listview에서 각 항목 들의 여백
                      vertical: 0,
                      horizontal: 0),
                  trailing: Text(
                    "2023/07/12",
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),

                // 각 팀 타일 사이에 구분선 추가
                Divider(
                    thickness: 1,
                    color: isDarkMode ? Colors.white.withOpacity(0.4) : Colors.black.withOpacity(0.4)
                ),

                //리스트 타일 사이에 여백
                SizedBox(
                  height: 4,
                ),

                // 위로 3
                ListTile(
                  dense: false,
                  // 사용자가 작성한 고민 글 제목 으로 보여주기
                  title: Text(
                    "왜 나만 이럴까",
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  visualDensity: VisualDensity(
                      // listview에서 각 항목 들의 여백
                      vertical: 0,
                      horizontal: 0),
                  trailing: Text(
                    "2023/07/10",
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),

                // 각 팀 타일 사이에 구분선 추가
                Divider(
                    thickness: 1,
                    color: isDarkMode ? Colors.white.withOpacity(0.4) : Colors.black.withOpacity(0.4)
                ),

                //리스트 타일 사이에 여백
                SizedBox(
                  height: 4,
                ),
              ],
            ),

            // 새로운 리스트 항목 넣기
          ),
        ],
      ),
    );
  }
}
