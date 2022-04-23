import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kaihatsu_test/main.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = "";
  String _password = "";
  String infoText = "";

  @override
  Widget build(BuildContext context) {
    final UserState userState = Provider.of<UserState>(context);

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Email',
              ),
              onChanged: (String value) {
                _email = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Password',
              ),
              onChanged: (String value) {
                _password = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        try {
                          UserCredential signIn = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: _email, password: _password);
                          // ユーザー情報更新
                          userState.setUser(signIn.user!);
                          await Navigator.of(context)
                              .pushReplacementNamed('/mainPage');
                        } catch (e) {
                          // Error
                          setState(() {
                            infoText = "ログインに失敗しました: ${e.toString()}";
                          });
                        }
                      },
                      child: Text('Signin')),
                  const SizedBox(
                    width: 8.0,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/signUpPage');
                      },
                      child: Text('SignUp')),
                ]),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Text(infoText),
          ),
        ],
      ),
    ));
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    String _email = "";
    String _password = "";
    bool passwordVeil = true;

    final UserState userState = Provider.of<UserState>(context);

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

    void signUp() async {
      try {
        final FirebaseAuth auth = FirebaseAuth.instance;
        final UserCredential userCredential = await auth
            .createUserWithEmailAndPassword(email: _email, password: _password);
        // ユーザー情報更新
        userState.setUser(userCredential.user!);
        await Navigator.of(context).pushReplacementNamed('/mainPage');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too week.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that mail.');
        }
      } catch (e) {
        print(e);
      }
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
                signUp();
              },
              child: const Text('SignUp')),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.back_hand),
      ),
    );
  }
}
