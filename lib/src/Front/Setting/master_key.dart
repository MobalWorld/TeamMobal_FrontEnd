
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobalworld/src/Front/Group/group_code_confirm.dart';
import 'package:mobalworld/src/Front/Group/worry_and_wiiroo.dart';
// import문에서 첫번째 .. : ㅣ
import '../appbar page/alarm.dart';
import '../appbar page/storage_3/storage.dart';
import '../appbar page/storage_3/temporary_storage.dart';
import '../appbar page/storage_3/worry_storage.dart';

import '../login/add_google_info.dart';
import '../login/login.dart';

import '../Group/group_main.dart';
import '../Group/group_make.dart';
import '../Group/group_select.dart';
import 'toung.dart';
import '../Start_Page/join_make_page.dart';
import 'main_loading.dart';
import '../appbar page/storage_3/storagebox_btn.dart';
import '../Worry writting/worry_Writing.dart';

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
                  child: Text('Google Login'),
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
                    'worry_Writing',
                  ),
                ),
                DropdownMenuItem(
                  value: 'group_make',
                  child: Text(
                    'group_make',
                  ),
                ),
                DropdownMenuItem(
                  value: 'fin_storage',
                  child: Text(
                    'fin_storage',
                  ),
                ),
                DropdownMenuItem(
                  value: 'code_confirm',
                  child: Text(
                    'code_confirm',
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
                } else if (value == 'group_make') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GroupMake()));
                } else if (value == 'fin_storage') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FinStorage()));
                } else if (value == 'code_confirm') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GroupCodeConfirm()));
                }
              },
            ),
          ],
        ),
      );

  }
}
