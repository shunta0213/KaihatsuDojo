import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kaihatsudojo/model/authenticationData/authenticationData.dart';
import 'package:kaihatsudojo/model/authenticationData/singUpData.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Provider
    final infoText = ref.watch<String>(signUpTextProvider);
    final infoTextState = ref.read(signUpTextProvider.state);
    final bool passwordVeil = ref.watch<bool>(passwordVeilProvider);

    String _email = "";
    String _password = "";
    String _password1 = "";

    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.orangeAccent, Colors.white],
                begin: Alignment.topRight,
                end: Alignment.bottomCenter),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 16),
                height: 150,
                width: 150,
                foregroundDecoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.center,
                    scale: 8,
                    image: AssetImage(''), //アイコンの画像を入れる予定
                  ),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFFFFF3ED), Color(0xFFFFE0B2)],
                      begin: Alignment.topRight,
                      end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                child: TextFormField(
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white, width: 1.45)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white, width: 1.45)),
                    border: OutlineInputBorder(),
                    labelText: 'メールアドレス',
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onChanged: (String _emailTemp) {
                    if (infoText != "") {
                      infoTextState.update((state) => state = '');
                    }
                    _email = _emailTemp;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.45)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.45)),
                            border: OutlineInputBorder(),
                            labelText: 'パスワード',
                            labelStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          // hide password
                          obscureText: !passwordVeil,
                          onChanged: (String value) {
                            if (infoText != "") {
                              infoTextState.update((state) => state = '');
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
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.45)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.45)),
                            border: const OutlineInputBorder(),
                            labelText: '確認',
                            labelStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            suffixIcon: IconButton(
                              tooltip: 'Show Password',
                              icon: Icon(passwordVeil
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                ref
                                    .read(passwordVeilProvider.state)
                                    .update((state) => state = !state);
                              },
                            ),
                          ),
                          // hide password
                          obscureText: !passwordVeil,
                          onChanged: (String value) {
                            if (infoText != "") {
                              infoTextState.update((state) => state = '');
                            }
                            _password1 = value;
                          }),
                    ),
                  ],
                ),
              ),
              Text(infoText),
              ElevatedButton(
                onPressed: () async =>
                    signUp(context, ref, _password, _password1, _email),
                child: const Text(
                  '登録',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
                  primary: Color(0xFFFFF3ED),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () => Navigator.of(context).pop(),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
