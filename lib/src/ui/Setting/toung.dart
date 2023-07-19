
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobalworld/src/ui/bottom.dart';

import '../master_key.dart';

class ToungPage extends StatefulWidget {
  const ToungPage({super.key});

  @override
  State<ToungPage> createState() => _ToungPageState();
}

class _ToungPageState extends State<ToungPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("고 민 써 줘.. 힝~",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          MasterKey(margin: 0),
        ],
      ),
      bottomNavigationBar: bottomWidget(),
    );
  }
}
