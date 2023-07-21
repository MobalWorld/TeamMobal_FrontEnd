import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobalworld/src/ui/Group/group_select.dart';



class GroupCodeConfirm extends StatelessWidget {
  const GroupCodeConfirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              "편지함 만들기",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 25,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: Center(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  Text("그룹코드",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                    ),
                  ),
                  //간격 여백
                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F2FD),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      child: Text("1 2 3 4",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,

                        ),
                      ),
                    ),
                  ),

                  //간격 여백
                  SizedBox(
                    height: 40,
                  ),

                  //코드 복사하기 버튼
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer),

                    onPressed: () {
                    //코드 복사 되었을 경우 하단부에 알림
                    final snackBar = SnackBar(
                        content: const Text('✅ 그룹 코드가 복사되었습니다!'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    } ,
                    child: Text('코드 복사하기',
                      style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.w600,
                    ),),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  //코드 공유하기 버튼
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer),

                    onPressed: () {
                    // 코드 공유하는 버튼
                     } ,
                    child: Text('코드 공유하기',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,

                      ),),
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  //확인 버튼
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                        Theme.of(context).colorScheme.secondaryContainer),
                    onPressed: () {
                    Get.to(
                      GroupSelect(),
                    );
                    } , child: Text('확인',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                    ),
                  ),

                  SizedBox(
                    height: 55,
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
