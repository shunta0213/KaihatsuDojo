import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaihatsudojo/view/drawer/drawerPages/note/noteDialog.dart';

/// メモを取得

Stream<QuerySnapshot<Map<String, dynamic>>> getNote({required String uid}) {
  return FirebaseFirestore.instance
      .collection('Data')
      .doc('note')
      .collection(uid)
      .snapshots();
}

/// メモを追加
///
void addNote({
  required String uid,
  required String noteTitle,
  required String note,
}) async {
  final noteRef = FirebaseFirestore.instance
      .collection('Data')
      .doc('note')
      .collection(uid)
      .doc(noteTitle);
  await noteRef.set({
    'title': noteTitle,
    'note': note,
  });
}

/// メモが存在するか確認

void addNoteCheck({
  required BuildContext context,
  required String noteTitle,
  required String note,
  required String uid,
}) async {
  final ref = FirebaseFirestore.instance
      .collection('Data')
      .doc('note')
      .collection(uid)
      .doc(noteTitle);

  await ref.get().then((DocumentSnapshot document) {
    if (document.exists) {
      showNoteDoubleCheckDialog(
        ref: ref,
        context: context,
        document: document,
        noteTitle: noteTitle,
        note: note,
        uid: uid,
      );
    } else {
      addNote(
        uid: uid,
        noteTitle: noteTitle,
        note: note,
      );
    }
  });
}

/// メモ消去

void deleteNote({
  required String uid,
  required DocumentSnapshot document,
  required BuildContext context,
}) async {
  await FirebaseFirestore.instance
      .collection('Data')
      .doc('note')
      .collection(uid)
      .doc(document.get('title'))
      .delete();
}
