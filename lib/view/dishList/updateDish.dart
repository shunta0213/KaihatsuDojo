import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void updateDish({
  required BuildContext context,
  required String uid,
  required DocumentSnapshot document,
  required DateTime now,
}) async {
  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('作成日更新'),
          content: Text('${document.get('name')}の作成日を変更しますか？'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection(uid)
                    .doc(document.get('name'))
                    .update({
                  'date': now,
                });
                Navigator.of(context).pop();
              },
              child: Text('確認'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('キャンセル'),
            ),
          ],
        );
      });
}
