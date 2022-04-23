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
                labelText: 'メール',
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
                labelText: 'パスワード',
              ),
              obscureText: _passwordVeil,
              onChanged: (String value) {
                _password = value;
              },
            ),
          ),
          SizedBox(
            width: 225,
            child: CheckboxListTile(
              title: const Text('パスワードを表示'),
              controlAffinity: ListTileControlAffinity.leading,
              value: !_passwordVeil,
              onChanged: (bool? e) {
                if (e == null) {
                  setState(() {
                    _passwordVeil = false;
                  });
                } else {
                  setState(() {
                    _passwordVeil = !e;
                  });
                }
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
                            _infoText = "ログインに失敗しました: ${e.toString()}";
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
          Container(
            padding: const EdgeInsets.all(8),
            child: Text(_infoText),
          ),
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
  bool _passwordVeil = false;
  String _infoText = "";

  @override
  Widget build(BuildContext context) {
    final UserState userState = Provider.of<UserState>(context);
    RegExp pattern = RegExp(r"(?=.*[a-z])(?=.*[A-Z])\w+");
    bool passCheckBool = true;

    void togglePassVile (bool? check) {
        if (check == null) {
          setState(() {
            _passwordVeil = false;
          });
        } else {
          setState(() {
            _passwordVeil = check;
          });
        }
      }

    void pathCheck() {
      setState(() {
        passCheckBool = pattern.hasMatch(_password);
        setState(() {
          if (_password != _password1) {
            _infoText = "パスワードが一致しません";
          } else if (!passCheckBool) {
            _infoText = 'パスワードは、半角英小文字・大文字・数字を組み合わせて入力してください';
          }
        });
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
        setState(() {
          if (e.code == 'weak-password') {
            _infoText = 'パスワードは、半角英小文字・大文字・数字を組み合わせて入力してください';
          } else if (e.code == 'email-already-in-use') {
            _infoText = 'このメールアドレスにはすでにアカウントが存在します';
          }
        });
      } catch (e) {
        print(e);
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
                    onChanged: (String value) => _password = value,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '確認',
                    ),
                    // hide password
                    obscureText: !_passwordVeil,
                    onChanged: (String value) => _password1 = value,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 225,
            child: CheckboxListTile(
              title: const Text('パスワードを表示'),
              controlAffinity: ListTileControlAffinity.leading,
              value: _passwordVeil,
              onChanged: (bool? e) => togglePassVile(e),
            ),
          ),
          Text(_infoText),
          ElevatedButton(
              onPressed: () async {
                pathCheck();
                if (passCheckBool) {
                  signUp();
                }
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
