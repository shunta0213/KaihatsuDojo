import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void showEditDishDialog ({
  required BuildContext context,
  required DocumentSnapshot document,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      final String initDishName = document.get('dish');
      final String initDishNote = document.get('notes');

      return AlertDialog(
        title: const Text('編集'),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              // dishName / 料理の名前 変更
              TextFormField(
                initialValue: initDishName,
              ),
              // Note / メモ　変更
              TextFormField(
                initialValue: initDishNote,
              ),
            ],
          ),
        ),
        actions: [
          // 変更
          MaterialButton(onPressed: () {}),
          // キャンセル
          MaterialButton(onPressed: () {}),
        ],
      );
    }
  );
}