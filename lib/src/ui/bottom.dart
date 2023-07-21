import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobalworld/src/ui/Setting/myPage.dart';

import 'Group/group_select.dart';
import 'worry_Writing.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomWidget(),
    );
  }


}


BottomNavigationBar bottomWidget() {
  return BottomNavigationBar(
    items: <BottomNavigationBarItem>[
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
        Get.to(
          GroupSelect(),
        );
      } else if (index == 1) {
        Get.to(
          WorryWriting(),
        );
      } else if (index == 2) {
        Get.to(
          MyPage(),
        );
      }
    },

  );
}