import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailProvider = StateProvider<String>((ref) {
  return '';
});

final passwordProvider = StateProvider<String>((ref) {
  return '';
});

final passwordCheckProvider = StateProvider<String>((ref) {
  return '';
});

final errorTextProvider = StateProvider<String>((ref) {
  return '';
});

final passwordVeilProvider = StateProvider.autoDispose<bool>((ref) {
  return true;
});

final signUpTextProvider = StateProvider<String>((ref) {
  return '';
});