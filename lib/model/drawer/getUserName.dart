import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<DocumentSnapshot<Object?>>?  getUserName () {
  final db = FirebaseFirestore.instance;
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  return db.collection('User').doc(uid).get();
}