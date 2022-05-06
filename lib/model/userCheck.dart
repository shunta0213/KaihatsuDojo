import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kaihatsudojo/view/authentication/singIn.dart';
import 'package:kaihatsudojo/view/topPage/top.dart';

final User? user = FirebaseAuth.instance.currentUser;

Widget userCheck(BuildContext context) {
  if (user != null) {
    Future.delayed(const Duration(seconds: 2));
    return const TopPage();
  } else {
    Future.delayed(const Duration(seconds: 2));
    return const LoginPage();
  }
}
