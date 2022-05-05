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
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 0),
            child: Container(
              padding: EdgeInsets.only(bottom: 13.2, top: 36),
              decoration: const BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color(0xFFFFFDE7), Color(0xFFFFECB3)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                // border: Border(
                //   bottom: BorderSide(color: Color(0xFFFFD54F), width: 0.8),
                // ),
              ),
              height: deviceHeight * 0.155,
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
                  padding: EdgeInsets.only(left: 15),
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    return ListTile(
                      tileColor: Colors.white,
                      leading: CircleAvatar(
                        radius: 10,
                        child: const Icon(
                          Icons.circle,
                          size: 0,
                        ),
                      ),
                      title: Text(
                        document.get('name'),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      minLeadingWidth: 26.5,
                      minVerticalPadding: 10,
                      subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                          child: const Icon(
                            Icons.delete_outline_sharp,
                            color: Colors.grey,
                          )),
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
          backgroundColor: Color(0xFFFFD54F),
          child: const Icon(Icons.clear, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
