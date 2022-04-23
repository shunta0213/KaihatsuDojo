import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:kaihatsu_test/login_form.dart';
import 'package:kaihatsu_test/display.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class UserState extends ChangeNotifier {
  User? user;
  final _auth = FirebaseAuth.instance;

  void setUser(User newUser) {
    user = newUser;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final UserState userState = UserState();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserState>(
      create: (context) => UserState(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        //for debug
        debugShowCheckedModeBanner: false,
        title: 'Authentication Test',
        routes: {
          '/loginPage': (context) => const LoginPage(),
          '/signUpPage': (context) => const SignUpPage(),
          '/mainPage' : (context) => const MainPage(),
        },
        home: const LoginPage(),
      ),
    );
  }
}