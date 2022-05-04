import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaihatsudojo/const/authentication/decoration.dart';

import 'package:kaihatsudojo/model/authenticationData/authenticationData.dart';
import 'package:kaihatsudojo/model/authenticationData/singInData.dart';
import 'package:kaihatsudojo/view/authentication/textFormField.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final infoTextState = ref.read(signUpTextProvider.state);
    final bool passwordVeil = ref.watch<bool>(passwordVeilProvider);
    final emailState = ref.read(emailProvider.state);
    final passwordState = ref.read(passwordProvider.state);

    return Scaffold(
      body: Center(
        child: Container(
          decoration: AuthDecoration.gradation,
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
                decoration: AuthDecoration.buttonDecoration,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                child: AuthTextFormField(
                  labelText: 'メールアドレス',
                  infoProvider: infoTextState,
                  valueProvider: emailState,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                child: AuthTextFormField(
                  passwordVeil: passwordVeil,
                  labelText: 'パスワード',
                  infoProvider: infoTextState,
                  valueProvider: passwordState,
                  ref: ref,
                  isSuffixIconEnable: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () async => signIn(
                        context,
                        ref,
                        email: ref.watch(emailProvider),
                        password: ref.watch(passwordProvider),
                      ),
                      child: Text(
                        'サインイン',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: AuthColors.buttonTextColor,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 15, bottom: 15),
                          primary: AuthColors.buttonPrimaryColor,
                          shape: AuthDecoration.buttonBorder,
                      ),
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
                        shape: AuthDecoration.buttonBorder,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
