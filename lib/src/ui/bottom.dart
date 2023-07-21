import 'package:flutter/material.dart';
import 'package:mobalworld/src/ui/Setting/myPage.dart';
import 'package:mobalworld/src/ui/worry_Writing.dart';

import 'Group/group_select.dart';


class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    GroupSelect(),
    WorryWriting(),
    MyPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: '그룹',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: '고민 작성',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: '프로필',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.onPrimaryContainer,
        onTap: _onItemTapped,
      ),
    );
  }
}