import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:kaihatsudojo/model/dishData.dart';

/// 追加するノートのタイトルが同じ場合に更新するかの確認用ダイアログ

void showDishDoubleCheckDialog({
  required DocumentReference ref,
  required BuildContext context,
  required DocumentSnapshot document,
  required String uid,
  required String? dishName,
  required String? genre,
  required String? notes,
  required DateTime now,
}) async {
  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '$dishNameはすでに存在します',
          ),
          actions: <Widget>[
            MaterialButton(
              onPressed: () async {
                addDishes(
                    context: context,
                    uid: uid,
                    dishName: dishName,
                    genre: genre,
                    notes: notes,
                    now: now);
                Navigator.of(context).pop();
              },
              child: const Text(
                '更新',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            MaterialButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'キャンセル',
              ),
            ),
          ],
        );
      });
}