import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobalworld/src/Front/Color_UI/padding.dart';
import 'package:mobalworld/src/Front/Group/group_code_confirm.dart';
import 'package:mobalworld/src/Front/Group/group_make.dart';
import 'package:provider/provider.dart';

//import 'package:mobalworld/src/ui/Setting/main_loading.dart';

import '../Setting/theme_provider.dart';
import '../login/add_google_info.dart';
import '../login/login.dart';
import '../Setting/master_key.dart';

class JoinMakePage extends StatefulWidget {
  const JoinMakePage({Key? key}) : super(key: key);

  @override
  State<JoinMakePage> createState() => _JoinMakePageState();
}

class _JoinMakePageState extends State<JoinMakePage> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Scaffold(
      body: Center(
        child: Padding(
          // 전체 패딩 값 - 함수로 불러와서 쓰기
          padding: GetPadding(),
          child: Column(
            children: [
              SizedBox(
                height: 0.2.sh,
              ),
              Container(
                  child: Icon(
                Icons.water_drop_outlined,
                size: 0.2.sh,
                color: Color(0xFFFCCAA9),
              )),
              Container(
                alignment: Alignment.bottomCenter,
                child: const Text(
                  '편지의 마음',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 0.07.sh,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            '편지함을 만들고 싶나요?',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 90,
                        )
                      ],
                    ),
                    Container(
                      child: Transform.translate(
                        offset: Offset(0, 40),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(GroupMake());
                            },
                            child: Text(
                              '만들기',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: isDarkMode? Colors.white : Colors.black,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: isDarkMode? Color(0xFF17171C) : Color(0xFFFCCAA9),
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0.03.sh,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  borderRadius: BorderRadius.circular(20),

                ),
                // 컨테이너의 차일드
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              '편지함 주소를 알고 있나요?',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),

                        SizedBox(
                          height: 90,
                        )
                      ],
                    ),
                    Container(
                      child: Transform.translate(
                        offset: Offset(0, 40),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(GroupCodeConfirm());
                            },
                            child: Text(
                              '참여하기',
                              style: TextStyle(
                                color: isDarkMode? Colors.white : Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isDarkMode? Color(0xFF17171C) : Color(0xFFFCCAA9) ,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
