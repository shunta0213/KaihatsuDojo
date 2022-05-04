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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 30),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'メール',
                  ),
                  onChanged: (String value) => email = value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 30),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'パスワード',
                    suffixIcon: IconButton(
                      tooltip: 'Show Password',
                      icon: Icon(
                          passwordVeil ? Icons.visibility_off : Icons
                              .visibility),
                      onPressed: () =>
                          ref
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
                          onPressed: () async =>  signIn(context, ref, email: email, password: password),
                          child: Text('サインイン')),
                      const SizedBox(width: 20),
                      ElevatedButton(
                          onPressed: () =>
                              Navigator.of(context).pushNamed('/signUpPage'),
                          child: Text('登録')),
                    ]),
              ),
              Text(_infoText),
            ],
          ),
        ));
  }
}
