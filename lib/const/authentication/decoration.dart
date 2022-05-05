import 'package:flutter/material.dart';

/// Authentication Pageのデザイン

/// Authentication Pageのカラー

class AuthColors {
  /// button のprimary color
  static Color buttonPrimaryColor = const Color(0xFFFFF3ED);

  /// buttonのText color
  static Color buttonTextColor = Colors.black54;
}

/// AuthenticationPageのデコレーション

class AuthDecoration {
  /// 画面全体のグラデーション
  static const gradation = BoxDecoration(
    gradient: LinearGradient(colors: [
      // Color(0xFFFFF3ED),
      // Color(0xFFFFE0B2),
      Colors.lightBlueAccent,
      Color(0xFFFFE0B2),
      Color(0xFFFFF3ED),
      // Color(0xFFFFE0B2),
      // Color(0xFFFFCC80),
      // Color(0xFFFFB74D),
      // Color(0xFFFFB74D),
      // Color(0xFFFFA726),
      //
      // Color(0xFFFFE0B2),
      // Color(0xFFFF),
      // Color(0xFFFF),
      // Color(0xFFFF),
      // Color(0xFFFF),
      // Color(0xFFFF),
      // Color(0xFFFF),
    ], begin: Alignment.topRight, end: Alignment.bottomCenter),
  );

  /// Button, TextFormField 用の アウトラインデコレーション
  static final inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(100),
    borderSide: BorderSide(color: Colors.black54, width: 0.9),
  );

  /// Button デコレーション
  static final buttonDecoration = BoxDecoration(
    gradient: LinearGradient(
        colors: [Color(0xFFFFF3ED), Color(0xFFFFF8E1)],
        begin: Alignment.topRight,
        end: Alignment.bottomCenter),
    borderRadius: BorderRadius.circular(100),
    boxShadow: [
      BoxShadow(
        //color: Color(0xFFFFF9C4), //色
        color: Colors.black12,
        spreadRadius: 0.00005,
        blurRadius: 20,
        offset: Offset(2, 10),
      ),
    ],
  );

  /// button shape
  static RoundedRectangleBorder buttonBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25),
  );
}
