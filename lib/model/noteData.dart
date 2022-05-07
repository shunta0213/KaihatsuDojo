import 'package:cloud_firestore/cloud_firestore.dart';

/// メモを取得

Stream<QuerySnapshot<Map<String, dynamic>>> getNote ({required String uid}) {
  return FirebaseFirestore.instance
      .collection(uid)
      .doc('note')
      .collection('note')
      .snapshots();
}

void addNote({
  required String? noteTitle,
  required String? note,
  required String uid,
}) async {
  await FirebaseFirestore.instance
      .collection('Data')
      .doc('note')
      .collection(uid)
      .doc()
      .set({
    'title': noteTitle,
    'note': note,
  });
}