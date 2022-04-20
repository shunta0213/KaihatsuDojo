import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      home: const AuthPage(),
    );
  }
}

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    String email = "";
    String password = "";

    //
    String passCheckSentence = 'Password must include at least one upper case';
    RegExp pattern = RegExp(r"(?=.*[a-z])(?=.*[A-Z])\w+");
    bool passCheck = false;

    // Firebase Auth
    final FirebaseAuth auth = FirebaseAuth.instance;

    // Text Editing controller
    final passController = TextEditingController();

    void pathCheck() {
      setState(() {
        passCheck = pattern.hasMatch(password);
        if (passCheck) {
          passCheckSentence = 'Good PassWord';
        } else {
          passCheckSentence = 'Password must include at least one upper case';
        }
      });
    }

    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Enter Email',
          ),
          onChanged: (String _email) {
            email = _email;
          },
        ),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'PassWord',
          ),
          // hide password
          obscureText: true,
          onChanged: (String _password) {
            password = _password;

            // implement
            pathCheck();
            print(passCheckSentence);
          },
        ),
      ],
    )));
  }
}
