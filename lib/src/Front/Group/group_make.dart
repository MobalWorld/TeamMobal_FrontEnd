import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobalworld/src/Front/Color_UI/padding.dart';
import 'package:provider/provider.dart';

import '../Setting/theme_provider.dart';
import '../Setting/toung.dart';
import 'group_code_confirm.dart';

class GroupMake extends StatefulWidget {
  const GroupMake({Key? key}) : super(key: key);

  @override
  State<GroupMake> createState() => _GroupMakeState();
}

class _GroupMakeState extends State<GroupMake> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _content = TextEditingController();
  bool IsName = false;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: isDarkMode? Colors.white : Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          '편지함 만들기',
          style: GoogleFonts.notoSans(
              textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20)),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: GetPadding(),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.02.sh),
                      child: Text('편지함 이름',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.02.sh),
                      child: Text(
                        '편지함 이름은 개설 이후에도 변경할 수 있습니다.',
                        style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.02.sh),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 1,
                        controller: _title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600),
                        onChanged: (String text) {
                          setState(() {
                            IsName = text.length > 0;
                          });
                        },
                        onTapOutside: (event) => //다른 화면 누를 때 키보드 down
                            FocusManager.instance.primaryFocus?.unfocus(),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: "제목을 입력해 주세요",
                          filled: true,
                          fillColor: Colors.transparent,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.9)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.02.sh),
                      child: Text('편지함 소개',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.02.sh),
                      child: Text(
                        '편지함 소개는 개설 이후에도 변경할 수 있습니다.',
                        style:
                             TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.02.sh),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 1,
                        controller: _content,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600),
                        onChanged: (String text) {
                          setState(() {
                            IsName = text.length > 0;
                          });
                        },
                        onTapOutside: (event) => //다른 화면 누를 때 키보드 down
                            FocusManager.instance.primaryFocus?.unfocus(),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: "편지함 소개를 적어주세요.",
                          filled: true,
                          fillColor: Colors.transparent,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.9)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.02.sh),
                      child: Text('대표 사진',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.02.sh),
                      child: Text(
                        '대표 사진은 편지함 페이지 커버에 표시 됩니다.',
                        style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.02.sh),
                      child: DottedBorder(
                        dashPattern: [6, 3],
                        strokeWidth: 1,
                        color: Colors.grey,
                        borderType: BorderType.Rect,
                        child: Container(
                          height: 200,
                          width: 400,
                          child: Center(
                            child: Container(
                              width:
                                  120, // Set the desired width for the button
                              height:
                                  30, // Set the desired height for the button
                              child: OutlinedButton.icon(
                                // <-- OutlinedButton
                                onPressed: () {},
                                icon: Icon(
                                  Icons.photo_camera_outlined,
                                  size: 15.0,
                                  color: Colors.grey,
                                ),
                                label: Text(
                                  'upload',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 0.02.sh, vertical: 0.01.sh),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(GroupCodeConfirm());
                      },
                      child: Text('만들기'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        ),
                          backgroundColor: Color(0xFFFFB487)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
