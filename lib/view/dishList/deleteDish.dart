import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void deleteDish({context, uid, document}) async {
  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('消去確認'),
          content: Text('${document.get('name')}を消去しますか？'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection(uid)
                    .doc(document.get('name'))
                    .delete();
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