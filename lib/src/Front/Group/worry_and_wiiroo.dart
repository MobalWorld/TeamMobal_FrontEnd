import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobalworld/src/Front/Color_UI/padding.dart';
import '../appbar page/storage_3/storagebox_btn.dart';
import '../Setting/bottom.dart';

class FinStorage extends StatefulWidget {
  const FinStorage({Key? key}) : super(key: key);

  @override
  State<FinStorage> createState() => _FinStorageState();
}

class _FinStorageState extends State<FinStorage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Get.to(Storagebox());
          },
          color: Colors.black,
        ),
        title: Column(
          children: [
            Text('2023년 07월 11일'),
            Text('23-1 한동 위로팀',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
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
                height: 0.08.sh,
              ),
              Center(
                child: Column(
                  children: [
                    // 위로가 위에 있게 배치
                    Container(
                      height: 0.3.sh,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.02.sh, vertical: 0.02.sh),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage(
                                      'assets/images/walrus.png',
                                    )),
                                SizedBox(
                                  width: 0.01.sh,
                                ),
                                Text(
                                  //From + 위로 보낸 사람의 닉네임
                                  'From. 바다표범',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            Divider(
                                color: Theme.of(context)
                                    .colorScheme
                                    .tertiaryContainer),
                            Text(
                              '내용',
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 0.02.sh,
                    ),

                    //여기에 붙여넣기 - 나의 고민
                    Container(
                      height: 0.3.sh,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.02.sh, vertical: 0.02.sh),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '(내가 작성했던 고민 제목) \n 매일 매일 목 말라 ',
                              style: TextStyle(fontSize: 20),
                            ),
                            Divider(
                              color:
                                  Theme.of(context).colorScheme.tertiaryContainer,
                            ),
                            Text(
                              '(내용) 안녕하세요 저는 매일 매일 목말라서 고민입니다. 왜 저는 항상 목이 마를까요'
                                  '얼마나 물을 더 마셔야 목이 안 마를지... 아니 이제는 물을 마시는게 맞는지도 잘 모르겠어요..'
                                  '어떻게 해야 이 목마름이 사라질까요..''물로만 목마름을 해결할 수 있을까요? ',
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomWidget(),
    );
  }
}
