import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Bottom extends StatelessWidget {
  const Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomWidget(),
    );
  }
}

BottomNavigationBar bottomWidget() {
  return BottomNavigationBar(
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: '그룹 리스트',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.edit),
        label: '고민 작성',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: '프로필',
      ),
    ],
    onTap: (int index) {
      // 각 버튼을 탭했을 때의 동작 처리
      if (index == 0) {
      } else if (index == 1) {
      } else if (index == 2) {
        Get.to(());
      }
    },
  );
}
