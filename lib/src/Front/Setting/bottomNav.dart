import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobalworld/src/Front/Setting/theme_provider.dart';
import 'package:provider/provider.dart';
import '../Group/group_main.dart';
import '../Group/group_select.dart';
import '../Worry writting/worry_Writing.dart';
import 'MyPage/myPage.dart';

class BottomNavi extends StatefulWidget {
  const BottomNavi({super.key});

  @override
  State<BottomNavi> createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _widgetOptions = <Widget>[
    GroupMain(),
    GroupSelect(),
    WorryWriting(),
    MyPage(),
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex == index) {
      // If the selected page is the same as the tapped page, do nothing.
      return;
    }

    _pageController.jumpToPage(index);

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _widgetOptions,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.list),
            label: '그룹',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.pen),
            label: '글쓰기',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidUser),
            label: '마이페이지',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: isDarkMode? Color(0xFF888C8A) : Color(0xFF888C8A),
        selectedItemColor: isDarkMode? Color(0xFF7BD88A) : Color(0xFF7BD88A),
        onTap: _onItemTapped,
      ),
    );
  }
}
