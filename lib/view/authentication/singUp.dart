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
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFFFFE082), Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 17),
                height: 160,
                width: 160,
                foregroundDecoration: const BoxDecoration(
                  image: DecorationImage(
                    scale: 3.9,
                    image: NetworkImage(
                      'https://cdn-icons-png.flaticon.com/512/2663/2663026.png',
                    ),
                    alignment: Alignment.center, //アイコンの画像を入れる予定
                  ),
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Color(0xFFFFF3ED), Color(0xFFFFF8E1)],
                      begin: Alignment.topRight,
                      end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      //color: Color(0xFFFFF9C4), //色
                      color: Colors.black12,
                      spreadRadius: 0.00005,
                      blurRadius: 20,
                      offset: Offset(2, 10),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide:
                            BorderSide(color: Colors.black54, width: 0.9)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide:
                            BorderSide(color: Colors.black54, width: 0.9)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    labelText: 'メールアドレス',
                    labelStyle: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
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
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                    color: Colors.black54, width: 0.9)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                    color: Colors.black54, width: 0.9)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            labelText: 'パスワード',
                            labelStyle: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500),
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
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                    color: Colors.black54, width: 0.9)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                                borderSide: BorderSide(
                                    color: Colors.black54, width: 0.9)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            labelText: '確認',
                            labelStyle: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500),
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
                  elevation: 6,
                  shadowColor: Colors.black87,
                  padding:
                      EdgeInsets.only(left: 74, right: 74, top: 15, bottom: 15),
                  primary: Color(0xFFFFF3ED),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
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
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white70,
          size: 34,
        ),
      ),
    );
  }
}
