// 고민 작성 중 임시 보관함 페이지

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobalworld/src/Front/Appbar%20page/storage_3/storagebox_btn.dart';
import 'package:mobalworld/src/Front/Group/group_main.dart';
import 'package:provider/provider.dart';
import '../../Color_UI/padding.dart';
import '../../Setting/bottom.dart';
import '../../Setting/theme_provider.dart';
import '../../Worry writting/temporary_write.dart';

class Temporay_StoragePage extends StatefulWidget {
  const Temporay_StoragePage({super.key});

  @override
  State<Temporay_StoragePage> createState() => _Temporay_StoragePageState();
}

class _Temporay_StoragePageState extends State<Temporay_StoragePage> {
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
                icon: Icon(Icons.arrow_back_ios_new),
                // 추후에 이동 기능 추가하기
                onPressed: () {
                  Get.to(Storagebox());
                },
                color: isDarkMode ? Colors.white : Colors.black
              ),
            ],
          ),
          centerTitle: true,
          title: Text(
            "임시 보관함",
            textAlign: TextAlign.center,
            style: TextStyle(
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
                // 임시 작성글 1
                ListTile(
                  onTap: () {
                    Get.to(TemporaryWrite());
                  },
                  dense: false,
                  // 사용자가 작성한 고민 글 제목 으로 보여주기
                  title: Text(
                    "쓰다만 글이지롱",
                    style: TextStyle(
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
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
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

                // 임시 작성글 2
                ListTile(
                  dense: false,
                  // 사용자가 작성한 고민 글 제목 으로 보여주기
                  title: Text(
                    "임시 작성 중인 글입니다",
                    style: TextStyle(
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
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),

                // 각 팀 타일 사이에 구분선 추가
                Divider(
                  thickness: 2,
                ),

                //리스트 타일 사이에 여백
                SizedBox(
                  height: 4,
                ),

                // 임시 작성글 3
                ListTile(
                  dense: false,
                  // 사용자가 작성한 고민 글 제목 으로 보여주기
                  title: Text(
                    "작성중이었는데 고민해결!",
                    style: TextStyle(
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
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),

                // 각 팀 타일 사이에 구분선 추가
                Divider(
                  thickness: 2,
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
