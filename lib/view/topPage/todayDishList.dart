import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TopDishesList extends StatelessWidget {
  /// 今日登録したメニューを表示
  const TopDishesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    // 今日の０時０分
    final today = DateTime(now.year, now.month, now.day, 0, 0, 0);
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final CollectionReference userDishes =
    FirebaseFirestore.instance.collection(uid);

    return FutureBuilder<QuerySnapshot>(
      future: userDishes
          .orderBy('date', descending: false)
          .startAt([Timestamp.fromDate(today)]).get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong.');
        } else if (snapshot.connectionState != ConnectionState.done) {
          return const CircularProgressIndicator();
        }

        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.circle,
                            size: 10,
                            color: Colors.black,
                          ),
                        ]),
                    title: Text(document.get('name')),
                    subtitle: Text(document.get('genre')),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}