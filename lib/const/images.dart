import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyImage {
  /// imageまとめ

  /// 牛
  static AssetImage cow = const AssetImage('assets/images/logo_1.png');
  /// 豚
  static AssetImage pig = const AssetImage('assets/images/logo_2.png');
  /// 鶏
  static AssetImage chicken = const AssetImage('assets/images/logo_3.png');
  /// 魚
  static AssetImage fish = const AssetImage('assets/images/logo_4.png');
  /// さらだ
  static AssetImage salad = const AssetImage('assets/images/logo_5.png');
  /// 汁物
  static AssetImage soup = const AssetImage('assets/images/logo_6.png');
  /// 麺
  static AssetImage noodle = const AssetImage('assets/images/logo_7.png');
  /// その他
  static AssetImage others = const AssetImage('assets/images/logo_8.png');
}

class ImagesWidget {
  /// 牛の画像
  static Image cow = Image.asset('assets/images/logo_1.png');
  /// 豚の画像
  static Image pig = Image.asset('assets/images/logo_2.png');
  /// 鶏
  static Image chicken = Image.asset('assets/images/logo_3.png');
  /// 魚
  static Image fish = Image.asset('assets/images/logo_4.png');
  /// さらだ
  static Image salad = Image.asset('assets/images/logo_5.png');
  /// 汁物
  static Image soup = Image.asset('assets/images/logo_6.png');
  /// 麺
  static Image noodle = Image.asset('assets/images/logo_7.png');
  /// その他
  static Image others = Image.asset('assets/images/logo_8.png');
}