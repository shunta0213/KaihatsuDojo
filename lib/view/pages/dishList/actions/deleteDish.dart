import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:kaihatsudojo/model/dishData.dart';

void deleteDishDialog({
  required BuildContext context,
  required String uid,
  required DocumentSnapshot document,
}) async {
  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            '消去確認',
            style: TextStyle(fontFamily: 'NotoSansJP'),
          ),
          content: Text(
            '${document.get('name')}を消去しますか？',
          ),
          actions: <Widget>[
            MaterialButton(
              onPressed: () async {
                deleteDish(context: context, uid: uid, document: document);
              },
              child: const Text(
                '消去',
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
