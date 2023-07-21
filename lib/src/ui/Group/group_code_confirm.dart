import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobalworld/src/ui/Group/group_select.dart';



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
                GroupSelect(),
              );
            } , child: Text('확인'),)
          ],
        ),
      ),
    );
  }
}
