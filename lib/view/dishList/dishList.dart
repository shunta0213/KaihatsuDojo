import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kaihatsudojo/model/dishData.dart';

import 'package:kaihatsudojo/const/dishList/popupButtonItem.dart';

class ListPage extends ConsumerWidget {
  final String? genre;
  final Widget? icon;

  const ListPage({
    required this.genre,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final String uid = auth.currentUser!.uid;
    final double deviceHeight = MediaQuery.of(context).size.height;
    final DateTime now = DateTime.now();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 0),
            child: Container(
              padding: const EdgeInsets.only(bottom: 13.2, top: 36),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
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
            stream: getDishListPageData(genre: genre),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              return Expanded(
                flex: 1,
                child: ListView(
                  padding: EdgeInsets.only(left: 15),
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    return ListTile(
                      tileColor: Colors.white,
                      leading: const CircleAvatar(
                        radius: 10,
                        child: Icon(
                          Icons.circle,
                          size: 0,
                        ),
                      ),
                      title: Text(
                        document.get('name'),
                        style: const TextStyle(
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
                      trailing: PopupMenuButton(
                        onSelected: (popupMenuItem result) {
                          switch (result) {
                            case popupMenuItem.none:
                              break;
                            case popupMenuItem.update:
                              return updateDish(
                                context: context,
                                uid: uid,
                                document: document,
                                now: now,
                              );
                            case popupMenuItem.delete:
                              return deleteDish(
                                context: context,
                                uid: uid,
                                document: document,
                              );
                          }
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<popupMenuItem>>[
                          const PopupMenuItem<popupMenuItem>(
                            value: popupMenuItem.update,
                            child: Text('作成日更新'),
                          ),
                          const PopupMenuItem<popupMenuItem>(
                            value: popupMenuItem.delete,
                            child: Text('消去'),
                          ),
                        ],
                      ),
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
          elevation: 3,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [Color(0xFFFFECB3), Colors.amber],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter),
            ),
            child: const Icon(
              Icons.clear,
              color: Colors.white,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
