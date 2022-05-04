import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaihatsudojo/model/authenticationData/authenticationData.dart';

void signIn(
  BuildContext context,
  WidgetRef ref, {
  required String email,
  required String password,
}) async {
  try {
    UserCredential signIn = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    await Navigator.of(context).pushReplacementNamed('/mainPage');
  } catch (e) {
    ref.read(errorTextProvider.state).update((state) => e.toString());
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text("ログインに失敗しました"),
            content: Text(ref.watch<String>(errorTextProvider)),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'))
            ],
          );
        });
  }
}
