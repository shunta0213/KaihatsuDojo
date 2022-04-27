import 'package:flutter/material.dart';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:provider/provider.dart';

import 'package:kaihatsudojo/pages/top.dart';
import 'package:kaihatsudojo/pages/addDishes.dart';
import 'package:kaihatsudojo/pages/viewPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // for debug
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      routes: {
        '/mainPage': (BuildContext context) => const MainPage(),
        '/addDishes': (BuildContext context) => const AddDishes(),
        '/viewPage': (BuildContext context) => const ViewPage(),
      },
      home: const MainPage(),
    );
  }
}