
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobalworld/src/ui/storagebox_btn.dart';
import 'package:mobalworld/src/ui/Setting/toung.dart';
import 'package:mobalworld/src/ui/worry_Writing.dart';
// import문에서 첫번째 .. : ㅣ
import "../../src/ui/appbar page/alarm.dart";
import "../../src/ui/appbar page/storage.dart";
import "../../src/ui/appbar page/temporary_storage.dart";
import "../../src/ui/appbar page/worry_storage.dart";

import '../../src/ui/login/add_google_info.dart';
import '../../src/ui/login/login.dart';

import 'Group/group_main.dart';
import 'Group/group_select.dart';
import 'join_make_page.dart';
import 'Setting/main_loading.dart';

class MasterKey extends StatelessWidget {
  const MasterKey({Key? key, required this.margin}) : super(key: key);
  final double margin;
  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: EdgeInsets.fromLTRB(0, margin, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              hint: Text('페이지 이동'),
              items: [
                DropdownMenuItem(
                  //로그인 페이지
                  value: 'login',
                  child: Text('Login'),
                ),
                DropdownMenuItem(
                  //마음의 편지 편지함 시작 페이지
                  value: 'joinmake',
                  child: Text('JoinMake'),
                ),
                DropdownMenuItem(
                  //로딩 페이지 -> 로고 보여주고 나가짐
                  value: 'loading',
                  child: Text(
                    'loading',
                  ),
                ),
                DropdownMenuItem(
                  //정보 입력 ; 별명, 휴대번호, 회원가입
                  value: 'info',
                  child: Text(
                    'add_info',
                  ),
                ),
                DropdownMenuItem(
                  //보관함 페이지 ; 위로, 고민, 임시 3개
                  value: 'storagebox',
                  child: Text(
                    'storagebox',
                  ),
                ),
                DropdownMenuItem(
                  // 텅~ 페이지
                  value: 'toung',
                  child: Text(
                    'Toung',
                  ),
                ),
                DropdownMenuItem(
                  //완전 메인, 그룹 안에 리스트 페이지
                  value: 'groupmain',
                  child: Text(
                    'GroupMain',
                  ),
                ),
                DropdownMenuItem(
                  //살짝 메인, 그룹 선택 리스트
                  value: 'groupselect',
                  child: Text(
                    'GroupSelect',
                  ),
                ),
                DropdownMenuItem(
                  //알림 페이지
                  value: 'alarm',
                  child: Text(
                    'Alarm',
                  ),
                ),
                DropdownMenuItem(
                  //위로 보관함 리스트
                  value: 'storage',
                  child: Text(
                    'storage',
                  ),
                ),
                DropdownMenuItem(
                  //임시 보관함 리스트
                  value: 'temporary',
                  child: Text(
                    'temporary',
                  ),
                ),
                DropdownMenuItem(
                  //나의 고민함 리스트
                  value: 'worry',
                  child: Text(
                    'worry',
                  ),
                ),
                DropdownMenuItem(
                  //고민 작성 페이지
                  value: 'worry_writing',
                  child: Text(
                    'worry_writing',
                  ),
                ),
              ],
              onChanged: (String? value) {
                if (value == 'joinmake') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => JoinMakePage()));
                } else if (value == 'loading') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoadingPage()));
                } else if (value == 'info') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GoogleAdditionalPage()));
                } else if (value == 'storagebox') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Storagebox()));
                } else if (value == 'login') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                } else if (value == 'toung') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ToungPage()));
                } else if (value == 'groupmain') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GroupMain()));
                } else if (value == 'groupselect') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GroupSelect()));
                } else if (value == 'alarm') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AlarmPage()));
                } else if (value == 'storage') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StoragePage()));
                } else if (value == 'temporary') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Temporay_StoragePage()));
                } else if (value == 'worry') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Worry_StoragePage()));
                } else if (value == 'worry_writing') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WorryWriting()));
                }
              },
            ),
          ],
        ),
      );

  }
}
