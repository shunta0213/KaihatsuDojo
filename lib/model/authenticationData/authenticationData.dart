import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Authenticationに使うProviderまとめ

/// email の状態管理用　
final emailProvider = StateProvider<String>((ref) {
  return '';
});

/// password の状態管理用
final passwordProvider = StateProvider<String>((ref) {
  return '';
});

/// 確認用パスワード　の状態管理用
final passwordCheckProvider = StateProvider<String>((ref) {
  return '';
});

/// サインイン時のエラーテキストの状態管理用
final errorTextProvider = StateProvider<String>((ref) {
  return '';
});

/// パスワードの表示非表示切り替え用
final passwordVeilProvider = StateProvider.autoDispose<bool>((ref) {
  return true;
});

/// SignUp/SignIn時のinfoTextの状態管理用
final signUpTextProvider = StateProvider<String>((ref) {
  return '';
});

/// ユーザー名の状態管理用
final userNameProvider = StateProvider<String>((ref) {
  return '';
});