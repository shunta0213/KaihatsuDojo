import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

/// 料理を追加

void addDishes({
  required BuildContext context,
  required uid,
  required String dishName,
  required String genre,
  required String notes,
  required DateTime now,
}) async {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  await db.collection('Data').doc('Dishes').collection(uid).doc(dishName).set(
    {
      'name': dishName,
      'genre': genre,
      'notes': notes,
      'date': now,
    },
  ).catchError((error) => print('error : $error'));
  Navigator.of(context).pop();
}

/// 料理を消去

void deleteDish({
  required String uid,
  required DocumentSnapshot document,
  required BuildContext context,
}) async {
  await FirebaseFirestore.instance
      .collection('Data')
      .doc('Dishes')
      .collection(uid)
      .doc(document.get('name'))
      .delete();
  Navigator.of(context).pop();
}

/// 料理の作成日を変更

void updateDish({
  required BuildContext context,
  required String uid,
  required DocumentSnapshot document,
  required DateTime now,
}) async {
  await FirebaseFirestore.instance
      .collection('Data')
      .doc('Dishes')
      .collection(uid)
      .doc(document.get('name'))
      .update({
    'date': now,
  });
}

/// TopPageの料理データ取得
/// 今日の０時０分以降に登録された料理を表示する。

Stream<QuerySnapshot<Object?>> getTopPageDishListData() {
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day, 0, 0, 0);
  return FirebaseFirestore.instance
      .collection('Data')
      .doc('Dishes')
      .collection(uid)
      .orderBy('date', descending: false)
      .startAt([Timestamp.fromDate(today)]).snapshots();
}

/// DishListPageの料理データ取得

Stream<QuerySnapshot<Object?>> getDishListPageData({
  required String? genre,
}) {
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  return FirebaseFirestore.instance
      .collection('Data')
      .doc('Dishes')
      .collection(uid)
      .where('genre', isEqualTo: genre)
      .snapshots();
}
