import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangeNickName extends StatefulWidget {
  const ChangeNickName({super.key});

  @override
  State<ChangeNickName> createState() => _ChangeNickNameState();
}

var _nickName;

class _ChangeNickNameState extends State<ChangeNickName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 0.03.sh, vertical: 0.02.sh),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: '제목',
                ),
                onChanged: (value) {
                  setState(() {
                    _nickName = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
