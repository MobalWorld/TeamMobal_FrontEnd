import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Group/group_select.dart';
import '../Worry writting/worry_Writing.dart';
import 'MyPage/myPage.dart';


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
        icon: FaIcon(FontAwesomeIcons.list),
        label: '그룹 리스트',
      ),

      BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.pen),
        label: '고민 작성',
      ),
      BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.solidUser),
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