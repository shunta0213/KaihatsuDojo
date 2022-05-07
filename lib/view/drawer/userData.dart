import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kaihatsudojo/model/drawer/getUserName.dart';

class UserName extends StatelessWidget {
  const UserName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: getUserName(),
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
          style: const TextStyle(
              color: Colors.black87,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              height: 0.3),
        );
      },
    );
  }
}
