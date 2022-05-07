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
    final infoTextState = ref.read(signUpTextProvider.state);
    final emailState = ref.read(emailProvider.state);
    final passwordState = ref.read(passwordProvider.state);
    final passwordCheckState = ref.read(passwordCheckProvider.state);
    final userNameState = ref.read(userNameProvider.state);

    final infoText = ref.watch<String>(signUpTextProvider);
    final bool _passwordVeil = ref.watch<bool>(passwordVeilProvider);

    return Scaffold(
      body: Center(
        child: Container(
          decoration: AuthDecoration.gradation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 17),
                height: 160,
                width: 160,
                foregroundDecoration: const BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.center,
                    // scale: 4,
                    // image: AssetImage(''), //アイコンの画像を入れる予定
                    scale: 3.9,
                    image: NetworkImage(
                      'https://cdn-icons-png.flaticon.com/512/2663/2663026.png',
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Color(0xFFFFF3ED), Color(0xFFFFF8E1)],
                      begin: Alignment.topRight,
                      end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
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
              // foregroundDecoration: const BoxDecoration(
              // image:  DecorationImage(
              // alignment: Alignment.center,
              // scale: 8,
              // image: AssetImage(''), //アイコンの画像を入れる予定
              //   ),
              //  ),
              //  decoration: AuthDecoration.buttonDecoration,

              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                child: AuthTextFormField(
                  labelText: 'ユーザー名',
                  infoText: infoText,
                  infoProvider: infoTextState,
                  valueProvider: userNameState,
                ),
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
                    ref.watch(emailProvider),
                    ref.watch(userNameProvider),
                  );
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
                  elevation: 6,
                  shadowColor: Colors.black87,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 86, vertical: 15),
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
        elevation: 3,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                colors: [Color(0xFFFFECB3), Colors.amber],
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter),
          ),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
