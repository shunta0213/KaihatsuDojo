import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kaihatsudojo/pages/authentication/singIn.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kaihatsudojo/pages/top.dart';
import 'package:kaihatsudojo/pages/addDishes.dart';
import 'package:kaihatsudojo/pages/viewPage.dart';
import 'package:kaihatsudojo/pages/authentication/singUp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const ProviderScope(child: MyApp()),
  );
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
          '/loginPage': (context) =>  const LoginPage(),
          '/signUpPage': (context) =>  SignUpPage(),
          '/mainPage': (BuildContext context) => const TopPage(),
          '/addDishes': (BuildContext context) => const AddDishes(),
          '/viewPage': (BuildContext context) => const ViewPage(),
        },
        home: const LoginPage(),
      );
  }
}
