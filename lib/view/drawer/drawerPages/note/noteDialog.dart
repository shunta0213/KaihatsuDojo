import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kaihatsudojo/model/noteData.dart';

/// 追加するノートのタイトルが同じ場合に更新するかの確認用ダイアログ

void showNoteDoubleCheckDialog({
  required DocumentReference ref,
  required BuildContext context,
  required DocumentSnapshot document,
  required String noteTitle,
  required String note,
  required String uid,
}) async {
  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '\"$noteTitle\"は既に保存されていますが、上書きしますか?',
            style: TextStyle(fontSize: 15),
          ),
          actions: <Widget>[
            MaterialButton(
              onPressed: () async {
                addNote(uid: uid, noteTitle: noteTitle, note: note);
                Navigator.of(context).pop();
              },
              child: const Text(
                '上書き',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
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
