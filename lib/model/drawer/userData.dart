import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserName extends StatelessWidget {
  final CollectionReference<Map<String, dynamic>> userData;

  const UserName({required this.userData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: userData.doc('userName').get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        return Text(
          data['userName'],
          style: TextStyle(
              color: Colors.black87,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              height: 0.3),
        );
      },
    );
  }
}
