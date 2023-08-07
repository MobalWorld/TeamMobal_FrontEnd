import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../Color_UI/padding.dart';
import '../../Setting/theme_provider.dart';
import '../../Worry writting/temporary_write.dart';
import '../../appbar page/storage_3/storagebox_btn.dart';

class Temporay_StoragePage extends StatefulWidget {
  const Temporay_StoragePage({super.key});

  @override
  State<Temporay_StoragePage> createState() => _Temporay_StoragePageState();
}

class _Temporay_StoragePageState extends State<Temporay_StoragePage> {
  final List<String> titles = [
    "쓰다만 글이지롱",
    "임시 작성 중인 글입니다",
    "작성중이었는데 고민해결!"
  ];

  final List<String> dates = ["2023/07/16", "2023/07/12", "2023/07/10"];

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
                onPressed: () {
                  Get.to(Storagebox());
                },
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ],
          ),
          centerTitle: true,
          title: Text(
            "임시 보관함",
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
        padding: GetPadding(),
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Dismissible(
                key: Key(titles[index]),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (direction) {
                  if (direction == DismissDirection.endToStart) {
                    // 저장하려는 아이템 정보를 임시 변수에 저장
                    final removedItem = titles[index];

                    setState(() {
                      titles.removeAt(index);
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('임시 메세지가 삭제됨', style: TextStyle(
                              color: isDarkMode ? Colors.white : Colors.black,
                            )),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  titles.insert(index, removedItem);
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
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Get.to(TemporaryWrite());
                      },
                      dense: false,
                      title: Text(
                        titles[index],
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      visualDensity: VisualDensity(
                        vertical: 0,
                        horizontal: 0,
                      ),
                      trailing: Text(
                        dates[index],
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: isDarkMode
                    ? Colors.white.withOpacity(0.4)
                    : Colors.black.withOpacity(0.4),
              ),
            ],
          );
        },
      ),
    );
  }
}
