import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:kaihatsudojo/model/dishData.dart';

void updateDishDialog({
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
            MaterialButton(
              onPressed: () async {
                updateDish(context: context, uid: uid, document: document, now: now);
                Navigator.of(context).pop();
              },
              child: Text(
                '更新',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            MaterialButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('キャンセル'),
            ),
          ],
        );
      });
}
