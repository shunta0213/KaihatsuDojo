import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kaihatsudojo/model/authenticationData/authenticationData.dart';
import 'package:kaihatsudojo/model/authenticationData/singInData.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String email = "";
    String password = "";
    String _infoText = "";

    final String errorText = ref.watch<String>(errorTextProvider);
    final bool passwordVeil = ref.watch<bool>(passwordVeilProvider);

    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFFFFE082), Colors.white],
                begin: Alignment.topRight,
                end: Alignment.bottomCenter),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 30),
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
                  onChanged: (String value) => email = value,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 30),
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
                    labelText: 'パスワード',
                    labelStyle: const TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                    suffixIcon: IconButton(
                      tooltip: 'Show Password',
                      icon: Icon(passwordVeil
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () => ref
                          .read(passwordVeilProvider.state)
                          .update((state) => !passwordVeil),
                    ),
                  ),
                  obscureText: passwordVeil,
                  onChanged: (String value) => password = value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () async => signIn(context, ref,
                          email: email, password: password),
                      child: const Text(
                        'サインイン',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 6,
                          shadowColor: Colors.black87,
                          padding: const EdgeInsets.only(
                              left: 95, right: 95, top: 15, bottom: 15),
                          primary: const Color(0xFFFFF3ED),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          )),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/signUpPage'),
                      child: const Text(
                        '新規登録',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.black54),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 6,
                        shadowColor: Colors.black87,
                        padding: const EdgeInsets.only(
                            left: 103, right: 103, top: 15, bottom: 15),
                        primary: const Color(0xFFFFF3ED),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(_infoText),
            ],
          ),
        ),
      ),
    );
  }
}
