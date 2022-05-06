import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('まいほーむ'),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.amber, Color(0xFFFFD54F)] //グラデーションの設定
                )),
      ),
    );
  }
}
