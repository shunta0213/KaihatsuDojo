import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaihatsudojo/const/authentication/decoration.dart';
import 'package:kaihatsudojo/model/authenticationData/authenticationData.dart';

class AuthTextFormField extends StatelessWidget {
  final String labelText;
  final String? infoText;
  final StateController<String> infoProvider;
  final StateController<String> valueProvider;

  bool? passwordVeil;
  bool? isSuffixIconEnable;
  final WidgetRef? ref;

  /// AuthenticationPage用のtext form field

  AuthTextFormField(
      {this.ref,
      this.isSuffixIconEnable,
      this.infoText,
      this.passwordVeil,
      required this.infoProvider,
      required this.valueProvider,
      required this.labelText,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    passwordVeil ??= false;
    isSuffixIconEnable ??= false;

    if (!isSuffixIconEnable!) {
      return TextFormField(
        obscureText: passwordVeil!,
        decoration: InputDecoration(
          enabledBorder: AuthDecoration.inputBorder,
          focusedBorder: AuthDecoration.inputBorder,
          border: const OutlineInputBorder(),
          labelText: labelText,
          labelStyle: const TextStyle(
              color: Colors.black54, fontWeight: FontWeight.w500),
        ),
        onChanged: (String e) {
          if (infoText != "") {
            infoProvider.update((state) => state = '');
          }
          valueProvider.update((state) => state = e);
          print(e);
        },
      );
    } else {
      return TextFormField(
        obscureText: passwordVeil!,
        decoration: InputDecoration(
            enabledBorder: AuthDecoration.inputBorder,
            focusedBorder: AuthDecoration.inputBorder,
            border: const OutlineInputBorder(),
            labelText: labelText,
            labelStyle: const TextStyle(
                color: Colors.black54, fontWeight: FontWeight.w500),
            suffixIcon: IconButton(
              tooltip: 'Show Password',
              icon:
                  Icon(passwordVeil! ? Icons.visibility_off : Icons.visibility),
              onPressed: () => ref!
                  .read(passwordVeilProvider.state)
                  .update((state) => !passwordVeil!),
            )),
        onChanged: (String e) {
          if (infoText != "") {
            infoProvider.update((state) => state = '');
          }
          valueProvider.update((state) => state = e);
          print(e);
        },
      );
    }
  }
}
