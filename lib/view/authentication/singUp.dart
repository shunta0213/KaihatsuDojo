import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaihatsudojo/const/authentication/decoration.dart';

import 'package:kaihatsudojo/model/authenticationData/authenticationData.dart';
import 'package:kaihatsudojo/model/authenticationData/singUpData.dart';
import 'package:kaihatsudojo/view/authentication/textFormField.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Provider
    final infoText = ref.watch<String>(signUpTextProvider);
    final infoTextState = ref.read(signUpTextProvider.state);
    final emailState = ref.read(emailProvider.state);
    final passwordState = ref.read(passwordProvider.state);
    final passwordCheckState = ref.read(passwordCheckProvider.state);
    final bool _passwordVeil = ref.watch<bool>(passwordVeilProvider);

    return Scaffold(
      body: Center(
        child: Container(
          decoration: AuthDecoration.gradation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                height: 150,
                width: 150,
                // foregroundDecoration: const BoxDecoration(
                // image:  DecorationImage(
                // alignment: Alignment.center,
                // scale: 8,
                // image: AssetImage(''), //アイコンの画像を入れる予定
                //   ),
                //  ),
                //  decoration: AuthDecoration.buttonDecoration,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                child: AuthTextFormField(
                  labelText: 'メールアドレス',
                  infoText: infoText,
                  infoProvider: infoTextState,
                  valueProvider: emailState,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: AuthTextFormField(
                        infoText: infoText,
                        labelText: 'パスワード',
                        infoProvider: infoTextState,
                        valueProvider: passwordState,
                        isSuffixIconEnable: true,
                        ref: ref,
                        passwordVeil: _passwordVeil,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      flex: 1,
                      child: AuthTextFormField(
                        infoText: infoText,
                        labelText: '確認',
                        infoProvider: infoTextState,
                        valueProvider: passwordCheckState,
                        isSuffixIconEnable: true,
                        ref: ref,
                        passwordVeil: _passwordVeil,
                      ),
                    ),
                  ],
                ),
              ),
              Text(ref.watch(signUpTextProvider)),
              ElevatedButton(
                onPressed: () async {
                  signUp(
                      context,
                      ref,
                      ref.watch(passwordProvider),
                      ref.watch(passwordCheckProvider),
                      ref.watch(emailProvider));
                },
                child: Text(
                  '登録',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AuthColors.buttonTextColor,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  primary: AuthColors.buttonPrimaryColor,
                  shape: AuthDecoration.buttonBorder,
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
