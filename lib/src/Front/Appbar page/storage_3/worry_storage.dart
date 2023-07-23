import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Color_UI/padding.dart';
import '../../Setting/bottom.dart';

class Worry_StoragePage extends StatefulWidget {
  const Worry_StoragePage({super.key});

  @override
  State<Worry_StoragePage> createState() => _Worry_StoragePageState();
}

class _Worry_StoragePageState extends State<Worry_StoragePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        //appbar 높이 조절
        preferredSize: Size.fromHeight(
          75.0,
        ),

        child: AppBar(
          toolbarHeight: 75,
          backgroundColor: Colors.white,

          //뒤로가기 버튼
          leading: Row(
            children: [
              IconButton(
                color: Colors.black,
                icon: Icon(Icons.arrow_back_ios_new),

                // 추후에 이동 기능 추가하기
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          centerTitle: true,
          title: Text(
            "나의 고민 보관함",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 23,
              color: Colors.black,
            ),
          ),
        ),
      ),

      /////body - 리스트 시작
      body: ListView(
        padding: //패딩 통일해서 위젯으로 사용하자는 말 나왓엇음, 어떻게 할건지 상의하기
            GetPadding(),
        children: <Widget>[
          SingleChildScrollView(
            // 스크롤 가능하게
            child: Column(
              children: [
                // 고민 1
                ListTile(
                  dense: false,
                  title: Text(
                    "매일 매일 목말라",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  //from + 위로해준 사용자 이름
                  subtitle: Text(
                    "From. 목 안 마른 사슴",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  //참여자 명수 변수 받아

                  visualDensity: VisualDensity(
                      // listview에서 각 항목 들의 여백
                      vertical: 0,
                      horizontal: 0),

                  // 맨 앞에 오는 그룹의 프로필 이미지
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/deer.jpg'),
                    radius: 25, //프로필 사진 원 사이즈 -> 30으로 고정
                  ),

                  //고민 작성 날짜
                  trailing: Text(
                    "2023/07/16",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),

                // 각 팀 타일 사이에 구분선 추가
                Divider(
                  thickness: 2,
                ),

                //리스트 타일 사이 여백
                SizedBox(
                  height: 4,
                ),

                // 고민 2
                ListTile(
                  dense: false,
                  title: Text(
                    "판다에게 차인 이후 살고싶지 않아",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  //from + 위로해준 사용자 이름
                  subtitle: Text(
                    "From. 푸바오 팬클럽 회장",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  //참여자 명수 변수 받아

                  visualDensity: VisualDensity(
                      // listview에서 각 항목 들의 여백
                      vertical: 0,
                      horizontal: 0),

                  // 맨 앞에 오는 그룹의 프로필 이미지
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/fubao.webp'),
                    radius: 25, //프로필 사진 원 사이즈 -> 30으로 고정
                  ),

                  //고민 작성 날짜
                  trailing: Text(
                    "2023/07/13",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),

                // 각 팀 타일 사이에 구분선 추가
                Divider(
                  thickness: 2,
                ),

                //리스트 타일 사이 여백
                SizedBox(
                  height: 4,
                ),

                // 고민 3
                ListTile(
                  dense: false,
                  title: Text(
                    "불쌍한 인간들",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  //from + 위로해준 사용자 이름
                  subtitle: Text(
                    "From.오이맛 수박",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  //참여자 명수 변수 받아

                  visualDensity: VisualDensity(
                      // listview에서 각 항목 들의 여백
                      vertical: 0,
                      horizontal: 0),

                  // 맨 앞에 오는 그룹의 프로필 이미지
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/water52.jpg'),
                    radius: 25, //프로필 사진 원 사이즈 -> 30으로 고정
                  ),

                  //고민 작성 날짜
                  trailing: Text(
                    "2023/07/10",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),

                // 팀 타일 사이에 구분선 추가
                Divider(
                  thickness: 2,
                ),

                //리스트 타일 사이 여백
                SizedBox(
                  height: 4,
                ),

// 개수 늘리기용 복붙
                // 고민 1
                ListTile(
                  dense: false,
                  title: Text(
                    "매일 매일 목말라",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  //from + 위로해준 사용자 이름
                  subtitle: Text(
                    "From. 목 안 마른 사슴",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  //참여자 명수 변수 받아

                  visualDensity: VisualDensity(
                      // listview에서 각 항목 들의 여백
                      vertical: 0,
                      horizontal: 0),

                  // 맨 앞에 오는 그룹의 프로필 이미지
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/deer.jpg'),
                    radius: 25, //프로필 사진 원 사이즈 -> 30으로 고정
                  ),

                  //고민 작성 날짜
                  trailing: Text(
                    "2023/07/16",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),

                // 각 팀 타일 사이에 구분선 추가
                Divider(
                  thickness: 2,
                ),

                //리스트 타일 사이 여백
                SizedBox(
                  height: 4,
                ),

                // 고민 2
                ListTile(
                  dense: false,
                  title: Text(
                    "판다에게 차인 이후 살고싶지 않아",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  //from + 위로해준 사용자 이름
                  subtitle: Text(
                    "From. 푸바오 팬클럽 회장",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  //참여자 명수 변수 받아

                  visualDensity: VisualDensity(
                      // listview에서 각 항목 들의 여백
                      vertical: 0,
                      horizontal: 0),

                  // 맨 앞에 오는 그룹의 프로필 이미지
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/fubao.webp'),
                    radius: 25, //프로필 사진 원 사이즈 -> 30으로 고정
                  ),

                  //고민 작성 날짜
                  trailing: Text(
                    "2023/07/13",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),

                // 각 팀 타일 사이에 구분선 추가
                Divider(
                  thickness: 2,
                ),

                //리스트 타일 사이 여백
                SizedBox(
                  height: 4,
                ),

                // 고민 3
                ListTile(
                  dense: false,
                  title: Text(
                    "불쌍한 인간들",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  //from + 위로해준 사용자 이름
                  subtitle: Text(
                    "From.오이맛 수박",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  //참여자 명수 변수 받아

                  visualDensity: VisualDensity(
                      // listview에서 각 항목 들의 여백
                      vertical: 0,
                      horizontal: 0),

                  // 맨 앞에 오는 그룹의 프로필 이미지
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/water52.jpg'),
                    radius: 25, //프로필 사진 원 사이즈 -> 30으로 고정
                  ),

                  //고민 작성 날짜
                  trailing: Text(
                    "2023/07/10",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),

                // 팀 타일 사이에 구분선 추가
                Divider(
                  thickness: 2,
                ),

                //리스트 타일 사이 여백
                SizedBox(
                  height: 4,
                ),

                // 고민 1
                ListTile(
                  dense: false,
                  title: Text(
                    "매일 매일 목말라",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  //from + 위로해준 사용자 이름
                  subtitle: Text(
                    "From. 목 안 마른 사슴",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  //참여자 명수 변수 받아

                  visualDensity: VisualDensity(
                      // listview에서 각 항목 들의 여백
                      vertical: 0,
                      horizontal: 0),

                  // 맨 앞에 오는 그룹의 프로필 이미지
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/deer.jpg'),
                    radius: 25, //프로필 사진 원 사이즈 -> 30으로 고정
                  ),

                  //고민 작성 날짜
                  trailing: Text(
                    "2023/07/16",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),

                // 각 팀 타일 사이에 구분선 추가
                Divider(
                  thickness: 2,
                ),

                //리스트 타일 사이 여백
                SizedBox(
                  height: 4,
                ),

                // 고민 2
                ListTile(
                  dense: false,
                  title: Text(
                    "판다에게 차인 이후 살고싶지 않아",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  //from + 위로해준 사용자 이름
                  subtitle: Text(
                    "From. 푸바오 팬클럽 회장",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  //참여자 명수 변수 받아

                  visualDensity: VisualDensity(
                      // listview에서 각 항목 들의 여백
                      vertical: 0,
                      horizontal: 0),

                  // 맨 앞에 오는 그룹의 프로필 이미지
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/fubao.webp'),
                    radius: 25, //프로필 사진 원 사이즈 -> 30으로 고정
                  ),

                  //고민 작성 날짜
                  trailing: Text(
                    "2023/07/13",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),

                // 각 팀 타일 사이에 구분선 추가
                Divider(
                  thickness: 2,
                ),

                //리스트 타일 사이 여백
                SizedBox(
                  height: 4,
                ),

                // 고민 3
                ListTile(
                  dense: false,
                  title: Text(
                    "불쌍한 인간들",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  //from + 위로해준 사용자 이름
                  subtitle: Text(
                    "From.오이맛 수박",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  //참여자 명수 변수 받아

                  visualDensity: VisualDensity(
                      // listview에서 각 항목 들의 여백
                      vertical: 0,
                      horizontal: 0),

                  // 맨 앞에 오는 그룹의 프로필 이미지
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/water52.jpg'),
                    radius: 25, //프로필 사진 원 사이즈 -> 30으로 고정
                  ),

                  //고민 작성 날짜
                  trailing: Text(
                    "2023/07/10",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),

                // 팀 타일 사이에 구분선 추가
                Divider(
                  thickness: 2,
                ),

                //리스트 타일 사이 여백
                SizedBox(
                  height: 4,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomWidget(),
    );
  }
}
