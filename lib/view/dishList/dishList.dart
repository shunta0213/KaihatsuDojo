import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kaihatsudojo/view/dishList/deleteDish.dart';

class ListPage extends StatelessWidget {
  final String? genre;
  final Widget? icon;

  const ListPage({
    required this.genre,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final String uid = auth.currentUser!.uid;
    final CollectionReference userDishes = db.collection(uid);
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 8),
            child: SizedBox(
              height: deviceHeight * 0.1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: icon,
              ),
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: userDishes.where('genre', isEqualTo: genre).snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              return Expanded(
                flex: 1,
                child: ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    return ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      tileColor: Colors.white,
                      leading: const Icon(
                        Icons.circle,
                        size: 10,
                      ),
                      title: Text(document.get('name')),
                      subtitle: Column(children: [
                        Text(DateFormat('作成日 : yyyy/MM/dd')
                            .format(document.get('date').toDate())),
                        Text(document.get('notes') ?? 'なにもないよ！'),
                      ]),
                      trailing: TextButton(
                          onPressed: () async => deleteDish(
                                context: context,
                                uid: uid,
                                document: document,
                              ),
                          child: const Icon(Icons.delete)),
                      dense: true,
                      contentPadding: const EdgeInsets.all(8),
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
          child: const Icon(Icons.clear),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
