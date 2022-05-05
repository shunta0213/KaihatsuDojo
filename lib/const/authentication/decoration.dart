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
    gradient: LinearGradient(
      colors: [Colors.orangeAccent, Colors.white],
      begin: Alignment.topRight,
      end: Alignment.bottomCenter,
    ),
  );

  /// Button, TextFormField 用の アウトラインデコレーション
  static const inputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1.45),
  );

  /// Button デコレーション
  static const buttonDecoration = BoxDecoration(
    gradient: LinearGradient(
        colors: [Color(0xFFFFF3ED), Color(0xFFFFE0B2)],
        begin: Alignment.topRight,
        end: Alignment.bottomCenter),
  );

  /// button shape
  static RoundedRectangleBorder buttonBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25),
  );
}
