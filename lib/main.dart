import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'package:kaihatsudojo/pages/top.dart';
import 'package:kaihatsudojo/pages/addDishes.dart';
import 'package:kaihatsudojo/pages/viewPage.dart';
import 'package:kaihatsudojo/pages/authentication.dart';
import 'package:page_transition/page_transition.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class UserState extends ChangeNotifier {
  User? user;

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
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/viewPage':
              return PageTransition(
                child: const ViewPage(),
                type: PageTransitionType.fade,
                duration: Duration(seconds: 5),
                reverseDuration: Duration(seconds: 5),
              );
              break;
            default:
              return null;
          }
        },

        // for debug
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        routes: {
          '/loginPage': (context) => const LoginPage(),
          '/signUpPage': (context) => const SignUpPage(),
          '/mainPage': (BuildContext context) => const TopPage(),
          '/addDishes': (BuildContext context) => const AddDishes(),
          '/viewPage': (BuildContext context) => const ViewPage(),
        },
        home: const LoginPage(),
      ),
    );
  }
}
