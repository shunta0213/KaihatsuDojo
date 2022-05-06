import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Note extends StatelessWidget {
  const Note({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Note'),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed('/addNote'),
                  child: Row(children: const [
                    Icon(Icons.add),
                    Text('Add Note'),
                  ]),
                )
              ],
            ),
          ),
          const Text('メモ一覧'),
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection(uid).doc('note').collection('note').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              return Expanded(
                flex: 4,
                child: ListView(
                  children: snapshot.data!.docs.map((DocumentSnapshot document) {
                    return ListTile(
                      title: Text(
                        document.get('title'),
                      ),
                      subtitle: Text(document.get('note')),
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.clear),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
