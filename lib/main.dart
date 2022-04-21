import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kaihatsu_test/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      //for debug
      debugShowCheckedModeBanner: false,
      title: 'Authentication Test',

      //Change LoginPage or AuthPage
      home: const LoginPage(),
    );
  }
}

