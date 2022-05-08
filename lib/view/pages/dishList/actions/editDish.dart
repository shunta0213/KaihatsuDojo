import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kaihatsudojo/const/dishList/decoration.dart';
import 'package:kaihatsudojo/model/dishData.dart';

void showEditDishDialog({
  required BuildContext context,
  required DocumentSnapshot document,
  required String uid,
}) async {
  String? dishName = document.get('name');
  String? notes = document.get('notes');
  String genre = document.get('genre');
  DateTime now = DateTime.now();
  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('編集'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                // dishName / 料理の名前 変更
                TextFormField(
                  initialValue: document.get('name'),
                  decoration: InputDecoration(
                    hintText: '名前変更',
                    labelText: '名前変更',
                    border: EditDishDecoration.inputBorder,
                  ),
                  onChanged: (String? value) {
                      dishName = value;
                  },
                ),
                // Note / メモ　変更
                TextFormField(
                  initialValue: document.get('notes'),
                  decoration: InputDecoration(
                    hintText: 'メモ変更',
                    labelText: 'メモ変更',
                    border: EditDishDecoration.inputBorder,
                  ),
                  onChanged: (String? value) {
                    notes = value;
                  },
                ),
              ],
            ),
          ),
          actions: [
            // 変更
            MaterialButton(
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                onPressed: () {
                  addDishes(
                    context: context,
                    uid: uid,
                    dishName: dishName,
                    genre: genre,
                    notes: notes,
                    now: now,
                  );
                }),
            // キャンセル
            MaterialButton(onPressed: () => Navigator.of(context).pop()),
          ],
        );
      });
}
