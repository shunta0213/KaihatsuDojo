import 'package:flutter/material.dart';

class DrawerDecoration {
  /// Drawerのデコレーション

  static const boxDecoration = BoxDecoration(
    gradient: LinearGradient(colors: [
      Color(0xFFFFE0B2),
      Color(0xFFFFD54F),
    ], begin: Alignment.topRight, end: Alignment.bottomCenter),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30.0),
      topRight: Radius.circular(30.0),
    ),
  );
}
