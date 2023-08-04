import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobalworld/src/Front/Color_UI/padding.dart';
import 'package:mobalworld/src/Front/Setting/theme_provider.dart';
import 'package:provider/provider.dart';

import 'bottom.dart';
import 'master_key.dart';

class ToungPage extends StatefulWidget {
  const ToungPage({super.key});

  @override
  State<ToungPage> createState() => _ToungPageState();
}

class _ToungPageState extends State<ToungPage> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Scaffold(
      backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFFBF9F4),
      body: SafeArea(
        child: Padding(
          padding: GetPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "고 민 써 줘.. 힝~",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'KOTRA HOPE',
                    ),
                  ),
                ],
              ),
              MasterKey(margin: 0),
            ],
          ),
        ),
      ),
    );
  }
}
