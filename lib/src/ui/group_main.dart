import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  'assets/walrus.png',
  'assets/peng1.jpg',
  'assets/peng2.jpg'
];

class _GroupMainState extends State<GroupMain> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          title: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/walrus.png'),
                radius: 30, //프로필 사진 원 사이즈 -> 30으로 고정
              ),
              SizedBox(width: 5),
              Text(
                '23-1 한동 위로팀',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.mail_outline, color: Colors.black)),
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications, color: Colors.black)),
          ],
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 0.01.sh,
                  vertical: 0.01.sh),
              child: Container(
                height: 0.15.sh,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
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
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                                  style: TextStyle(fontSize: 15, color: Color(0xFFF69B94), fontWeight: FontWeight.w600),
                                ),
                                TextSpan(
                                  text: '님의 한마디!',
                                  style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w800),
                                ),
                              ]
                          )
                      ),
                      SizedBox(height: 11),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage('assets/walrus.png'),
                            radius: 20, //프로필 사진 원 사이즈 -> 30으로 고정
                          ),
                          Text(
                            '모발모발 한동 위로팀! 다들 화이팅하자!!!',
                            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17.5, color: Colors.indigoAccent),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 0.01.sh, vertical: 40),
                  itemCount: name.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 40),
                      child: Container(
                        height: 0.20.sh,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Transform.translate(
                              offset: Offset(5, -20), // 왼쪽 상단으로 이동
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(image[index]),
                                radius: 20,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                          maxLines: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // 제목 <-> 내용 간격
                                  SizedBox(height: 8,),
                                  // 내용
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          content[index],
                                          style: TextStyle(fontSize: 12),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
