import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../Appbar page/storage_3/temporary_storage.dart';
import '../Color_UI/padding.dart';
import '../Group/group_main.dart';
import '../Setting/bottom.dart';
import '../Setting/bottomNav.dart';
import '../Setting/theme_provider.dart';

const List<String> list = <String>[
  '23-1 한동 위로 팀',
  '푸바오 사랑해 팀',
  '사랑아 시선해 팀',
];
class WorryWriting extends StatefulWidget {
  const WorryWriting({super.key});

  @override
  State<WorryWriting> createState() => _WorryWritingState();
}

class _WorryWritingState extends State<WorryWriting> {
  String title = '';
  String content = '';
  String group = "23-1 한동위로팀";
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Scaffold(
      backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFFBF9F4),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: AppBar(
          backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFFBF9F4),
          toolbarHeight: 75,
          leading: Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 100,
              child: TextButton(
                child: Text(
                  '취소',
                  style: TextStyle(fontSize: 15, color: Color(0xFFED7D79)),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: isDarkMode ? Color(0xFF161817) : Color(0xFFEFF0F2),
                        ),
                        height: 0.3.sh,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 0.1.sh,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(isDarkMode ? Color(0xFF161817) : Color(0xFFEFF0F2)),
                                  elevation:
                                      MaterialStateProperty.all<double>(0),
                                ),
                                onPressed: () {
                                  Get.offAll(() => BottomNavi());
                                },
                                child: Text(
                                  '작성취소',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 0.1.sh,
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(isDarkMode ? Color(0xFF161817) : Color(0xFFEFF0F2)),
                                  elevation:
                                      MaterialStateProperty.all<double>(0),
                                ),
                                onPressed: () {
                                  _showDialog(context, isDarkMode);
                                },
                                child: Text(
                                  '임시저장',
                                  style: TextStyle(color: Colors.blue[300]),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 0.1.sh,
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(isDarkMode ? Color(0xFF161817) : Color(0xFFEFF0F2)),
                                  elevation:
                                      MaterialStateProperty.all<double>(0),
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text(
                                  '취소',
                                  style: TextStyle(
                                      color: isDarkMode? Colors.white : Colors.black, fontSize: 14.sp),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          centerTitle: true,

          // 드랍 다운 시작
          title: DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(Icons.arrow_drop_down),
            elevation: 16,
            style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
                fontFamily: "Yeongdeok Blueroad",
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
              });
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              child: Text(
                '등록',
                style: TextStyle(color: isDarkMode? Colors.white : Colors.black , fontSize: 15),
              ),
              onPressed: () {
                _showDialog2(context,isDarkMode);
              },

            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: GetPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: '제목', labelStyle: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: isDarkMode ? Colors.white : Colors.black), // 포커스될 때 테두리 색상
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: isDarkMode ? Colors.white : Colors.black), // 포커스될 때 테두리 색상
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
                  onTapOutside: (event) => //다른 화면 누를 때 키보드 down
                  FocusManager.instance.primaryFocus?.unfocus()

              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                    labelText: '고민 내용', alignLabelWithHint: true, labelStyle: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: isDarkMode ? Colors.white : Colors.black), // 포커스될 때 테두리 색상
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: isDarkMode ? Colors.white : Colors.black), // 포커스될 때 테두리 색상
                    ),),

                onChanged: (value) {
                  setState(() {
                    content = value;
                  });
                },
                maxLines: 10,
                  onTapOutside: (event) => //다른 화면 누를 때 키보드 down
                  FocusManager.instance.primaryFocus?.unfocus()

              ),
            ],
          ),
        ),
      ),
    );
  }
}
void _showDialog(BuildContext context, bool isDarkMode) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: isDarkMode ? Color(0xFF62626B) : Color(0xFFEFF0F2),
        title: Text('임시 저장', style: TextStyle(color : isDarkMode ? Colors.white : Colors.black)),
        content: Text('임시 저장됩니다.', style: TextStyle(color : isDarkMode ? Colors.white : Colors.black)),
        actions: [
          TextButton(
            onPressed: () {
              Get.offAll(() => BottomNavi());
            },
            child: Text('확인', style: TextStyle(color : isDarkMode ? Colors.white : Colors.black)),
          ),
        ],
      );
    },
  );
}

void _showDialog2(BuildContext context, bool isDarkMode) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: isDarkMode ? Color(0xFF62626B) : Color(0xFFEFF0F2),
        title: Text('고민 작성 완료', style: TextStyle(color : isDarkMode ? Colors.white : Colors.black)),
        content: Text('고민 작성이 완료되었습니다.', style: TextStyle(color : isDarkMode ? Colors.white : Colors.black)),
        actions: [
          TextButton(
            onPressed: () {
              Get.offAll(() => BottomNavi());
            },
            child: Text('확인', style: TextStyle(color : isDarkMode ? Colors.white : Colors.black)),
          ),
        ],
      );
    },
  );
}
