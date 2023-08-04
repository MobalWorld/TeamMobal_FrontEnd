import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobalworld/src/Front/Setting/theme_provider.dart';
import 'package:provider/provider.dart';
import '../login/login.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 1),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFFBF9F4),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: Icon(
              Icons.water_drop_outlined,
              size: 160,
              color: Color(0xFFFCCAA9),
            )),
            Container(
              alignment: Alignment.bottomCenter,
              child: const Text(
                '마음의 편지',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'KOTRA HOPE',
                ),
              ),
            ),
            SizedBox(
              height: 150,
            )
          ],
        ),
      ),
    );
  }
}
