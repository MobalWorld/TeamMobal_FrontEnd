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
  int selectedIndex = 0;
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
        type: BottomNavigationBarType.fixed,
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
        backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFFFFFFF),
        unselectedItemColor: isDarkMode? Color(0xFF888C8A) : Color(0xFF888C8A),
        selectedItemColor: isDarkMode? Color(0xFFF8C8C4) : Color(0xFF000000),
        onTap: _onItemTapped,
      ),
      // body: Center(
      //     child: IndexedStack(
      //       index: selectedIndex,
      //       children: const [GroupMain(), GroupSelect(), WorryWriting(), MyPage()],
      //     )),
      // bottomNavigationBar: NavigationBar(
      //   selectedIndex: selectedIndex,
      //   onDestinationSelected: (value) => setState(() {
      //     selectedIndex = value;
      //   }),
      //   destinations: [
      //     NavigationDestination(
      //       icon: const Icon(Icons.home_filled),
      //       label: '홈',
      //       selectedIcon: Icon(
      //         Icons.home_filled,
      //         color: Theme.of(context).colorScheme.onPrimaryContainer,
      //       ),
      //     ),
      //     NavigationDestination(
      //       icon: const Icon(Icons.edit),
      //       label: '리스트',
      //       selectedIcon: Icon(
      //         Icons.edit,
      //         color: Theme.of(context).colorScheme.onTertiaryContainer,
      //       ),
      //     ),
      //     NavigationDestination(
      //       icon: const Icon(Icons.person),
      //       label: '글쓰기',
      //       selectedIcon: Icon(
      //         Icons.person,
      //         color: Theme.of(context).colorScheme.onSecondaryContainer,
      //       ),
      //     ),
      //     NavigationDestination(
      //       icon: const Icon(Icons.person),
      //       label: '마이페이지',
      //       selectedIcon: Icon(
      //         Icons.person,
      //         color: Theme.of(context).colorScheme.onSecondaryContainer,
      //       ),
      //     ),
      //   ],
      //   animationDuration: const Duration(milliseconds: 500),
      // ),
    );
  }
}
