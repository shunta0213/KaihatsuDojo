import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kaihatsudojo/model/dishData.dart';

class TopDishesList extends StatelessWidget {
  /// 今日登録したメニューを表示
  const TopDishesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: getTopPageDishListData(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong.');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        return Expanded(
          flex: 1,
          child: ListView(
            padding: EdgeInsets.only(right: 30, left: 30, top: 16),
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  leading: const Padding(
                    padding: EdgeInsets.only(top: 4.1),
                    child: CircleAvatar(
                      backgroundColor: Colors.black26,
                      radius: 7,
                      child: Icon(
                        Icons.circle,
                        size: 0,
                      ),
                    ),
                  ),
                  title: Text(
                    document.get('name'),
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        height: 0),
                  ),
                  minLeadingWidth: 8,
                  minVerticalPadding: 0,
                  subtitle: Text(
                    document.get('genre'),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
