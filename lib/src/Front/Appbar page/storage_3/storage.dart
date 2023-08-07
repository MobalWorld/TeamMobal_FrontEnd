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
  final List<String> items = ["행복하고 싶다", "살고 싶지 않아", "왜 나만 이럴까"];
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
      body: ListView.builder(
        padding: GetPadding(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Dismissible(
                key: Key(items[index]),
                onDismissed: (direction) {
                  if (direction == DismissDirection.endToStart) {
                    // 저장하려는 아이템 정보를 임시 변수에 저장
                    final removedItem = items[index];

                    setState(() {
                      items.removeAt(index);
                      final snackBar = SnackBar(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('위로 메세지가 삭제됨', style: TextStyle(
                              color: isDarkMode ? Colors.white : Colors.black,
                            )),
                            TextButton(
                              onPressed: () {
                                // 실행 취소 동작을 수행하여 아이템을 다시 복원
                                setState(() {
                                  items.insert(index, removedItem);
                                });
                                ScaffoldMessenger.of(context).hideCurrentSnackBar(); // 스낵바 닫기
                              },
                              child: Text(
                                '실행취소',
                                style: TextStyle(
                                  color: isDarkMode ? Colors.white : Colors.black,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    });
                  }

                },
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Get.to(WiroStorage());
                      },
                      dense: false,
                      title: Text(
                        items[index],
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      visualDensity: VisualDensity(
                        vertical: 0,
                        horizontal: 0,
                      ),
                      trailing: Text(
                        "2023/07/16",
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: isDarkMode
                    ? Colors.white.withOpacity(0.4)
                    : Colors.black.withOpacity(0.4),
              ),
            ],
          );
        },
      ),
    );

  }
}