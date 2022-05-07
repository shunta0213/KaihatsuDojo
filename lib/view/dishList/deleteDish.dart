import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../model/dishData.dart';

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
            style: TextStyle(fontFamily: 'NotoSansJP'),
          ),
          actions: <Widget>[
            MaterialButton(
              onPressed: () async {
                deleteDish(context: context, uid: uid, document: document);
                Navigator.of(context).pop();
              },
              child: const Text(
                '消去',
                style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoSansJP'),
              ),
            ),
            MaterialButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'キャンセル',
                style: TextStyle(fontFamily: 'NotoSansJP'),
              ),
            ),
          ],
        );
      });
}
