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
                colors: [Colors.orangeAccent, Colors.white],
                begin: Alignment.topRight,
                end: Alignment.bottomCenter),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                height: 150,
                width: 150,
                foregroundDecoration: const BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.center,
                    scale: 8,
                    image: AssetImage(''), //アイコンの画像を入れる予定
                  ),
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
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
                  onChanged: (String value) => email = value,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white, width: 1.45)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white, width: 1.45)),
                    border: const OutlineInputBorder(),
                    labelText: 'パスワード',
                    labelStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
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
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () async => signIn(context, ref,
                          email: email, password: password),
                      child: const Text(
                        'サインイン',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black54,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 15, bottom: 15),
                          primary: const Color(0xFFFFF3ED),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          )),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/signUpPage'),
                      child: const Text(
                        '新規登録',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black54),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(
                            left: 36, right: 36, top: 15, bottom: 15),
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
