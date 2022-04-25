import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kaihatsu_test/main.dart';
import 'package:provider/provider.dart';

// ログイン
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = "";
  String _password = "";
  String _infoText = "";
  bool _passwordVeil = true;
  String _errorText = "";

  @override
  Widget build(BuildContext context) {
    final UserState userState = Provider.of<UserState>(context);

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'メール',
              ),
              onChanged: (String value) {
                _email = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
            child: TextFormField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'パスワード',
                suffixIcon: IconButton(
                  tooltip: 'Show Password',
                  icon: Icon(
                      _passwordVeil ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _passwordVeil = !_passwordVeil;
                    });
                  },
                ),
              ),
              obscureText: _passwordVeil,
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
                            _errorText = e.toString();
                          });
                          showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  title: const Text("ログインに失敗しました"),
                                  content: Text(_errorText),
                                  actions: [
                                    TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('OK'))
                                  ],
                                );
                              });
                        }
                      },
                      child: Text('サインイン')),
                  const SizedBox(width: 20),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/signUpPage');
                      },
                      child: Text('登録')),
                ]),
          ),
          Text(_infoText),
        ],
      ),
    ));
  }
}

// 登録
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email = "";
  String _password = "";
  String _password1 = "";
  String _infoText = "";
  bool _passwordVeil = false;

  @override
  Widget build(BuildContext context) {
    final UserState userState = Provider.of<UserState>(context);
    // Regular expression for password validation
    RegExp pattern = RegExp(r"(?=.*[a-z])(?=.*[A-Z])\w+");
    bool passCheckBool = true;

    void signUp() async {// if password contains at least one lower case and upper case, return true
      passCheckBool =
          pattern.hasMatch(_password) && pattern.hasMatch(_password1);

      if (_email == "") {
        setState(() => _infoText = "メールアドレスを入力してください");
      } else if (_password == "" || _password1 == "") {
        setState(() => _infoText = "パスワードを入力してくさい");
      } else if (_password != _password1) {
        setState(() => _infoText = "パスワードが一致しません");
      } else if (!passCheckBool) {
        setState(() => _infoText = "パスワードは、半角英小文字・大文字を組み合わせて入力してください");
      } else {
        try {
          final FirebaseAuth auth = FirebaseAuth.instance;
          final UserCredential userCredential =
              await auth.createUserWithEmailAndPassword(
                  email: _email, password: _password);
          // ユーザー情報更新
          userState.setUser(userCredential.user!);
          await Navigator.of(context).pushReplacementNamed('/mainPage');
        } on FirebaseAuthException catch (e) {
          setState(() {
            if (e.code == 'weak-password') {
              _infoText = 'パスワードが短いです';
            } else if (e.code == 'email-already-in-use') {
              _infoText = 'このメールアドレスにはすでにアカウントが存在します';
            } else if (e.code == "invalid-email") {
              _infoText = "メールの形式を確かめてください";
            } else {
              _infoText = "エラーが発生しました";
            }
          });
        }
      }
    }

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'メールアドレス',
              ),
              onChanged: (String _emailTemp) {
                if (_infoText != "") {
                  setState(() {
                    _infoText = "";
                  });
                }
                _email = _emailTemp;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'パスワード',
                      ),
                      // hide password
                      obscureText: !_passwordVeil,
                      onChanged: (String value) {
                        if (_infoText != "") {
                          setState(() {
                            _infoText = "";
                          });
                        }
                        _password = value;
                      }),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '確認',
                        suffixIcon: IconButton(
                          tooltip: 'Show Password',
                          icon: Icon(_passwordVeil
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _passwordVeil = !_passwordVeil;
                            });
                          },
                        ),
                      ),
                      // hide password
                      obscureText: !_passwordVeil,
                      onChanged: (String value) {
                        if (_infoText != "") {
                          setState(() {
                            _infoText = "";
                          });
                        }
                        _password1 = value;
                      }),
                ),
              ],
            ),
          ),
          Text(_infoText),
          ElevatedButton(
              onPressed: () async {
                signUp();
              },
              child: const Text('登録')),
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
