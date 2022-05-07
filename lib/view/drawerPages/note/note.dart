import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kaihatsudojo/model/noteData.dart';
import 'package:kaihatsudojo/view/drawerPages/note/addNote.dart';

class Note extends StatelessWidget {
  const Note({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFFFFFDE7), Color(0xFFFFECB3)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter)),
        ),
        title: const Text('メモ',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            stream: getNote(uid: uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              return Expanded(
                flex: 4,
                child: ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 0.6, color: Colors.grey),
                        ),
                      ),
                      child: ListTile(
                        title: Text(
                          document.get('title') ?? 'タイトルなし',
                          style: TextStyle(fontSize: 18),
                        ),
                        subtitle: Text(
                          document.get('note') ?? '本文なし',
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 40),
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
              Icons.add,
              color: Colors.white,
            ),
          ),
          onPressed: () => showAddNoteDialog(context: context, uid: uid),
        ),
      ),
    );
  }
}
