import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaihatsudojo/model/authenticationData/authenticationData.dart';

void signUp(BuildContext context, WidgetRef ref,  String _password, String _password1, String _email) async {
  RegExp pattern = RegExp(r"(?=.*[a-z])(?=.*[A-Z])\w+");
  bool passCheckBool = true;
  final infoTextState = ref.read(signUpTextProvider.state);

  // if password contains at least one lower case and upper case, return true
  passCheckBool =
      pattern.hasMatch(_password) && pattern.hasMatch(_password1);

  if (_email == "") {
    infoTextState.update((state) => state = "メールアドレスを入力してください");
  } else if (_password == "" || _password1 == "") {
    infoTextState.update((state) => state = "パスワードを入力してくさい");
  } else if (_password != _password1) {
    infoTextState.update((state) => state = "パスワードが一致しません");
  } else if (!passCheckBool) {
    infoTextState.update((state) => state = "パスワードは、半角英小文字・大文字を組み合わせて入力してください");
  } else {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final UserCredential userCredential =
      await auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      await Navigator.of(context).pushReplacementNamed('/mainPage');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        infoTextState.update((state) => state = 'パスワードが短いです');
      } else if (e.code == 'email-already-in-use') {
        infoTextState.update((state) => state = 'このメールアドレスにはすでにアカウントが存在します');
      } else if (e.code == "invalid-email") {
        infoTextState.update((state) => state = "メールの形式を確かめてください");
      } else {
        infoTextState.update((state) => state = "エラーが発生しました");
      }

    }
  }
}