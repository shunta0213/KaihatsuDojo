import 'package:flutter/material.dart';

class DrawerDecoration {

  /// Drawerのデコレーション

  static const boxDecoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.amber,
        Color(0xFFFFD54F),
      ],
    ),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30.0),
      topRight: Radius.circular(30.0),
    ),
  );
}
