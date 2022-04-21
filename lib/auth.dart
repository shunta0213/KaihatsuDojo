import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    String _email = "";
    String _password = "";
    bool passwordVeil = true;

    //
    String passCheckSentence = 'Password must include at least one upper case';
    RegExp pattern = RegExp(r"(?=.*[a-z])(?=.*[A-Z])\w+");
    bool passCheck = false;

    void pathCheck() {
      setState(() {
        passCheck = pattern.hasMatch(_password);
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
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Email',
                  ),
                  onChanged: (String _emailTemp) {
                    _email = _emailTemp;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'PassWord',
                  ),
                  // hide password
                  obscureText: passwordVeil,
                  onChanged: (String _passwordTemp) {
                    _password = _passwordTemp;
                  },
                ),
                ElevatedButton(
                    onPressed: () async {
                      try {
                        final FirebaseAuth auth = FirebaseAuth.instance;
                        final UserCredential userCredential =
                        await auth.createUserWithEmailAndPassword(
                            email: _email, password: _password);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too week.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that mail.');
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: const Text('SignUp')),
              ],
            )));
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = "";
  String _password = "";

  final db = FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in');
    }
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Email',
                ),
                onChanged: (String _emailTemp) {
                  _email = _emailTemp;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Password',
                ),
                onChanged: (String _passwordTemp) {
                  _password = _passwordTemp;
                },
              ),
              ElevatedButton(onPressed: () async {
                try {
                  UserCredential signIn = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                      email: _email, password: _password);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email');
                  } else if (e.code == "wrong-password") {
                    print('Wrong password provided for that user');
                  }
                }
              }, child: Text('Signin')),

            ],
          ),
        ));
  }
}
