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
                margin: const EdgeInsets.only(bottom: 17),
                height: 160,
                width: 160,
                foregroundDecoration: const BoxDecoration(
                  image: DecorationImage(
                    scale: 3.9,
                    image: NetworkImage(
                      'https://cdn-icons-png.flaticon.com/512/2663/2663026.png',
                    ),
                    alignment: Alignment.center,
                  ),
                ),
                decoration: AuthDecoration.buttonDecoration,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 30),
                child: AuthTextFormField(
                  labelText: 'メールアドレス',
                  infoProvider: infoTextState,
                  valueProvider: emailState,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 30),
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
                padding: const EdgeInsets.only(top: 20, bottom: 16),
                child: Column(
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
                          fontWeight: FontWeight.w500,
                          color: AuthColors.buttonTextColor,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 6,
                        shadowColor: Colors.black87,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 95, vertical: 15),
                        primary: AuthColors.buttonPrimaryColor,
                        shape: AuthDecoration.buttonBorder,
                      ),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 103, vertical: 15),
                        primary: AuthColors.buttonPrimaryColor,
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
