import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobalworld/src/Front/Color_UI/padding.dart';
import 'package:mobalworld/src/Front/Group/group_main.dart';
import 'package:mobalworld/src/Front/Group/worry_miri.dart';
import 'package:provider/provider.dart';
import '../Setting/bottomNav.dart';
import '../Setting/theme_provider.dart';
import '../appbar page/storage_3/storagebox_btn.dart';
import '../Setting/bottom.dart';

class OverflowText extends StatefulWidget {
  const OverflowText({
    Key? key,
    required this.text,
    required this.maxLength,
  }) : super(key: key);

  final String text;
  final int maxLength;

  @override
  State<OverflowText> createState() => _OverflowTextState();
}

class _OverflowTextState extends State<OverflowText> {
  bool _isTextOverflow = false;
  bool _isMore = false;

  @override
  void initState() {
    super.initState();
    _isTextOverflow = widget.text.length > widget.maxLength;
    _isMore = !_isTextOverflow;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: TextStyle(color: isDarkMode ? Colors.white : Colors.black,),
          maxLines: _isTextOverflow && !_isMore
              ? 2
              : null, // Adjust the maxLines value as needed
          overflow: _isTextOverflow && !_isMore
              ? TextOverflow.ellipsis
              : TextOverflow.visible,
        ),
        if (_isTextOverflow && !_isMore)
          Container(
            margin: const EdgeInsets.only(top: 4),
            child: InkWell(
              onTap: () {
                setState(() {
                  _isMore = true;
                });
              },
              child: Text(
                '더보기',
                style: TextStyle(
                  color:
                  isDarkMode ? Colors.white : Colors.black, // Set your desired color for the "더보기" text
                ),
              ),
            ),
          )
        else if (_isMore)
          Container(
            margin: const EdgeInsets.only(top: 4),
            child: InkWell(
              onTap: () {
                setState(() {
                  _isMore = false;
                });
              },
              child: Text(
                '숨기기',
                style: TextStyle(
                  color:
                  isDarkMode ? Colors.white : Colors.black, // Set your desired color for the "숨기기" text
                ),
              ),
            ),
          ),
      ],
    );
  }
}

final _formKey = GlobalKey<FormState>();

class WiroWriting extends StatefulWidget {
  const WiroWriting({Key? key}) : super(key: key);

  @override
  State<WiroWriting> createState() => _WiroWritingState();
}

class _WiroWritingState extends State<WiroWriting> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Scaffold(
      backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFFBF9F4),
      appBar: AppBar(
        backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFFBF9F4),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          onPressed: () {
            Get.to(WorryMiri());
          },
          color: isDarkMode ? Colors.white : Colors.black,
        ),
        title: Column(
          children: [
            Text('2023년 07월 11일',style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),),
            Text('23-1 한동 위로팀',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                )),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: GetPadding(),
          child: Column(
            children: [
              SizedBox(
                height: 0.05.sh,
              ),
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '이름',
                            style: TextStyle(fontSize: 14,color: isDarkMode ? Colors.white : Colors.black,),
                          ),
                          // 이름과 날짜 사이 간격
                          SizedBox(width: 9),
                          Text(
                            '날짜',
                            style: TextStyle(fontSize: 14,color: isDarkMode ? Colors.white : Colors.black,),
                          ),
                        ],
                      ),
                      // 이름과날짜 <-> 제목 사이 간격
                      SizedBox(height: 8),
                      // 제목
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              '제목',
                              style: TextStyle(
                                color: isDarkMode ? Colors.white : Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      // 제목 <-> 내용 간격
                      SizedBox(
                        height: 8,
                      ),
                      // 내용
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: OverflowText(
                              text:
                                  '방학을 하고 항상 늦게 일어나고 있다. 빨리 일어나고 싶은데 온몸이 천근만근 너무 무겁다. 두근두근 설레는 마음으로 일어나고 싶어도 너무 잠이 부족하다. 수면부족의 큰 문제는 성격이 예민해진다는 것이고 이는 결국 다른 사람에게 상처를 줄 수 있을 만큼 예민해진다. 나는 언제쯤 잠을 많이 자게 될까? 그런데 주변을 보면 다들 늦게 자는 것 같다. 다크서클이 너무 심해서 동아리 이름을 다크라고 지어 다크서클이 되어도 좋을 것 같다. ',
                              maxLength: 1, // Set your desired max length here
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 0.05.sh,
                  ),

                  //여기에 붙여넣기 - 나의 고민
                  Container(
                    height: 0.35.sh,
                    decoration: BoxDecoration(
                      color: isDarkMode ? Color(0xFF242625) : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 0.02.sh, vertical: 0.01.sh),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                              decoration: InputDecoration(
                                labelText: '제목',
                                labelStyle: TextStyle(color: isDarkMode ? Colors.white.withOpacity(0.4) : Colors.black.withOpacity(0.4),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: isDarkMode ? Colors.white.withOpacity(0.4) : Colors.black), // 포커스될 때 테두리 색상
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: isDarkMode ? Colors.white.withOpacity(0.4) : Colors.black), // 포커스될 때 테두리 색상
                                ),
                              ),
                              onTapOutside: (event) => //다른 화면 누를 때 키보드 down
                                  FocusManager.instance.primaryFocus
                                      ?.unfocus()),
                          TextField(
                              decoration: InputDecoration(
                                  labelText: '내용',
                                  labelStyle: TextStyle(color: isDarkMode ? Colors.white.withOpacity(0.4) : Colors.black.withOpacity(0.4)),
                                  alignLabelWithHint: true,
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: isDarkMode ? Colors.white.withOpacity(0.4) : Colors.black), // 포커스될 때 테두리 색상
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: isDarkMode ? Colors.white.withOpacity(0.4) : Colors.black), // 포커스될 때 테두리 색상
                                  ),),

                              maxLines: 5,
                              onTapOutside: (event) => //다른 화면 누를 때 키보드 down
                                  FocusManager.instance.primaryFocus?.unfocus())
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.035.sh,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isDarkMode ? Color(0xFFFF6105) : Color(0xFFFF6105),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          Get.to(BottomNavi());
                        },
                        child: Text(
                          '보내기',
                          style: TextStyle(color: isDarkMode ? Colors.white : Colors.white),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
