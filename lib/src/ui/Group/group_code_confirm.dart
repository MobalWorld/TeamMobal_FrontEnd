import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../bottom.dart';

class GroupCodeConfirm extends StatelessWidget {
  const GroupCodeConfirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              Get.to(
                Bottom(),
              );
            } , child: Text('확인'),)
          ],
        ),
      ),
    );
  }
}
