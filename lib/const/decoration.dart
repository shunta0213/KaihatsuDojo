import 'package:flutter/material.dart';

const kButtonDradation = BoxDecoration(
  gradient: LinearGradient(
      colors: [Color(0xFFFFF3ED), Color(0xFFFFE0B2)],
      begin: Alignment.topRight,
      end: Alignment.bottomCenter),
);

const kLoginGradation = BoxDecoration(
  gradient: LinearGradient(
      colors: [Colors.orangeAccent, Colors.white],
      begin: Alignment.topRight,
      end: Alignment.bottomCenter),
);

final kLoginCircle = Container(
  margin: EdgeInsets.only(bottom: 16),
  padding: EdgeInsets.all(10),
  height: 150,
  width: 150,
  // foregroundDecoration: BoxDecoration(
  //   image: DecorationImage(
  //     alignment: Alignment.center,
  //     image: AssetImage('images/appIcon2.png'), //アイコンの画像を入れる予定
  child: Image.asset(
    'images/appIcon.png',
    width: 60,
    height: 60,
  ),

  decoration: BoxDecoration(
    gradient: LinearGradient(
        colors: [Color(0xFFFFF3ED), Color(0xFFFFE0B2)],
        begin: Alignment.topRight,
        end: Alignment.bottomCenter),
    borderRadius: BorderRadius.circular(100),
  ),
);
