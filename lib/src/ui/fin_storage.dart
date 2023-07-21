import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobalworld/src/ui/storagebox_btn.dart';

import 'bottom.dart';

class FinStorage extends StatefulWidget {
  const FinStorage({Key? key}) : super(key: key);

  @override
  State<FinStorage> createState() => _FinStorageState();
}

class _FinStorageState extends State<FinStorage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Get.to(Storagebox());
          },
          color: Colors.black,
        ),
        title: Column(
          children: [
            Text('2023년 07월 11일'),
            Text('23-1 한동 위로팀',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                )),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 0.05.sh,),
          Center(
            child:Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.01.sh,
                      vertical: 0.01.sh),
                  child: Container(
                    height: 0.15.sh,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: bottomWidget(),
    );
  }
}
