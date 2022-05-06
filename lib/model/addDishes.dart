import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

void addDishes(BuildContext context,
    {required uid,
      required String dishName,
      required String genre,
      required String notes,
      required DateTime now}) async {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference user = db.collection(uid);

  await user.doc(dishName).set(
    {
      'name': dishName,
      'genre': genre,
      'notes': notes,
      'date': now,
    },
    SetOptions(merge: true),
  ).catchError((error) => print('error : $error'));
  Navigator.of(context).pop();
}