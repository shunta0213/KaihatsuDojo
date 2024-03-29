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
      Colors.lightBlueAccent,
      Color(0xFFFFE0B2),
      Color(0xFFFFF3ED),
    ], begin: Alignment.topRight, end: Alignment.bottomCenter),
  );

  /// Button, TextFormField 用の アウトラインデコレーション
  static final inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(100),
    borderSide: const BorderSide(color: Colors.black54, width: 0.9),
  );

  /// Button デコレーション
  static final buttonDecoration = BoxDecoration(
    gradient: const LinearGradient(
        colors: [Color(0xFFFFF3ED), Color(0xFFFFF8E1)],
        begin: Alignment.topRight,
        end: Alignment.bottomCenter),
    borderRadius: BorderRadius.circular(100),
    boxShadow: const [
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
