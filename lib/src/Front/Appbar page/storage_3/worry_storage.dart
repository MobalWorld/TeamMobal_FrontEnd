import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobalworld/src/Front/Appbar%20page/storage_3/storagebox_btn.dart';
import 'package:provider/provider.dart';

import '../../Color_UI/padding.dart';
import '../../Group/worry_and_wiiroo.dart';
import '../../Setting/bottom.dart';
import '../../Setting/theme_provider.dart';

class Worry_StoragePage extends StatefulWidget {
  const Worry_StoragePage({super.key});

  @override
  State<Worry_StoragePage> createState() => _Worry_StoragePageState();
}

class _Worry_StoragePageState extends State<Worry_StoragePage> {
  final List<String> title = ["매일 매일 목말라", "판다에게 차인 이후 살고싶지 않아", "불쌍한 인간들"];
  final List<String> subtitle = ["From. 목 안 마른 사슴", "From. 푸바오 팬클럽 회장", "From.오이맛 수박"];
  final List<String> image = ["assets/images/deer.jpg", 'assets/images/fubao.webp', 'assets/images/water52.jpg'];
  final List<String> date = ["2023/07/16", "2023/07/13", "2023/07/10"];

  List<String> items = []; // 아이템 데이터를 관리하는 리스트

  @override
  void initState() {
    super.initState();
    items.addAll(title);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return Scaffold(
      backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFFBF9F4),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: AppBar(
          toolbarHeight: 75,
          backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFFBF9F4),
          leading: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios_new),
                color: isDarkMode ? Colors.white : Colors.black,
                onPressed: () {
                  Get.to(Storagebox());
                },
              ),
            ],
          ),
          centerTitle: true,
          title: Text(
            "나의 고민 보관함",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 23,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        padding: GetPadding(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart, // 오른쪽에서 왼쪽으로 스와이프
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (direction) {
                  if (direction == DismissDirection.endToStart) {
                    // 저장하려는 아이템 정보를 임시 변수에 저장
                    final removedItem = items[index];

                    setState(() {
                      items.removeAt(index);
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('고민 메세지가 삭제됨', style: TextStyle(
                              color: isDarkMode ? Colors.white : Colors.black,
                            )),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  items.insert(index, removedItem);
                                });
                                ScaffoldMessenger.of(context).hideCurrentSnackBar(); // 스낵바 닫기
                              },
                              child: Text(
                                '실행취소',
                                style: TextStyle(
                                  color: isDarkMode ? Colors.white : Colors.black,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
                child: ListTile(
                  onTap: () {
                    Get.to(FinStorage());
                  },
                  dense: false,
                  title: Text(
                    items[index],
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    subtitle[index],
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  visualDensity: VisualDensity(
                    vertical: 0,
                    horizontal: 0,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(image[index]),
                    radius: 25,
                  ),
                  trailing: Text(
                    date[index],
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: isDarkMode
                    ? Colors.white.withOpacity(0.4)
                    : Colors.black.withOpacity(0.4),
              ),
              SizedBox(height: 4),
            ],
          );
        },
      ),
    );
  }
}
