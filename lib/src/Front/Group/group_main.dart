import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobalworld/src/Front/Group/worry_miri.dart';
import '../Appbar page/storage_3/storagebox_btn.dart';
import '../Setting/bottom.dart';
import '../appbar page/alarm.dart';


class GroupMain extends StatefulWidget {
  const GroupMain({Key? key}) : super(key: key);

  @override
  State<GroupMain> createState() => _GroupMainState();
}

final List<String> name = <String>['오이맛 수박', '이름 2', '이름 3'];
final List<String> title = <String>[
  '일찍 일어나고 싶다',
  '제목 2',
  '제목 3',
];
final List<String> content = <String>[
  '방학을 하고 항상 늦게 일어나고 있다. 빨리 일어나고 싶은데 온몸이 천근만근 너무 무겁다. 두근두근 설레는 마음으로 일어나고 싶어도 너무 잠이 부족하다. 수면부족의 큰 문제는 성격이 예민해진다는 것이고 이는 결국 다른 사람에게 상처를 줄 수 있을 만큼 예민해진다. 나는 언제쯤 잠을 많이 자게 될까? 그런데 주변을 보면 다들 늦게 자는 것 같다. 다크서클이 너무 심해서 동아리 이름을 다크라고 지어 다크서클이 되어도 좋을 것 같다. ',
  '내용 2',
  '내용 3',
];
final List<String> date = <String>['2023. 07. 18', '날짜 2', '날짜 3'];
final List<String> image = <String>[
  'assets/images/water52.jpg',
  'assets/images/peng1.jpg',
  'assets/images/peng2.jpg'
];

class _GroupMainState extends State<GroupMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
        ),

        title:
          // mainAxisAlignment: MainAxisAlignment.center,
            Text(
              '23-1 한동 위로 팀',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
        ),
        actions:  [
          IconButton(
              onPressed: () {
                Get.to(Storagebox());
              },
              icon: Icon(Icons.mail_outline, color: Colors.black)),
          IconButton(
              onPressed: () {
                Get.to(AlarmPage());
              },
              icon: Icon(Icons.notifications, color: Colors.black)),
          ],
            centerTitle: true,
        ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.025.sw,
            ),
            child: Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text: TextSpan(
                          text: '우리 팀의 이번주 위로왕 ',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                          children: [
                        TextSpan(
                          text: '바다 표범',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFF69B94),
                              fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text: '님의 한마디!',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w800),
                        ),
                      ])),
                  SizedBox(height: 11),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                            AssetImage('assets/images/walrus.png'),
                        radius: 16, //프로필 사진 원 사이즈 -> 30으로 고정
                      ),
                      Text(
                        '모발모발 한동 위로팀! 다들 화이팅하자!!!',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 17.5,
                            color: Colors.indigoAccent),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.025.sw, vertical: 0.04.sh),
                itemCount: name.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Container(
                      height: 140,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('알림'),
                              content: Text(
                                  '고민에 대한 응답은 한번밖에 할 수 없어요! 진심을 담은 고민 답변 부탁드립니다 🧡'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Close the AlertDialog
                                  },
                                  child: Text('취소'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.to(
                                        GroupMiri()); // Close the AlertDialog
                                  },
                                  child: Text('확인'),
                                ),
                              ],
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          splashFactory: NoSplash
                              .splashFactory, // Disable the splash effect
                        ),
                        child: Transform.translate(
                          offset: Offset(5, -15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(image[index]),
                                radius: 20,
                              ),

                              // 이름과 날짜
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    name[index],
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  // 이름과 날짜 사이 간격
                                  SizedBox(width: 9),
                                  Text(
                                    date[index],
                                    style: TextStyle(fontSize: 14),
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
                                      title[index],
                                      style: TextStyle(
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
                                    child: Text(
                                      content[index],
                                      style: TextStyle(fontSize: 12),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: bottomWidget(),
    );
  }
}
