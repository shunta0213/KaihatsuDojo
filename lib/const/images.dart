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