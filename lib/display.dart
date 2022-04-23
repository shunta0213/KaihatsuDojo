import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final db = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    String? uid = user?.uid;
    if (uid == null) {
      uid = "no user";
    }
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,children: [Text(uid)],),
    );
  }
}

