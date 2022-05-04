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
                if (infoText != "") {
                  infoTextState.update((state) => state = '');
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
                        border: const OutlineInputBorder(),
                        labelText: '確認',
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
              child: const Text('登録')),
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
