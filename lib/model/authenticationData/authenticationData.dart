import 'package:flutter_riverpod/flutter_riverpod.dart';

final errorTextProvider = StateProvider<String>((ref) {
  return '';
});

final passwordVeilProvider = StateProvider<bool>((ref) {
  return true;
});

final signUpTextProvider = StateProvider<String>((ref) {
  return '';
});