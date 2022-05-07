import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

/// メモを取得

Stream<QuerySnapshot<Map<String, dynamic>>> getNote({required String uid}) {
  return FirebaseFirestore.instance
      .collection('Data')
      .doc('note')
      .collection(uid)
      .snapshots();
}

/// メモを追加

void addNote({
  required String? noteTitle,
  required String? note,
  required String uid,
}) async {
  await FirebaseFirestore.instance
      .collection('Data')
      .doc('note')
      .collection(uid)
      .doc(noteTitle)
      .set({
    'title': noteTitle,
    'note': note,
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
