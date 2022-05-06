import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddNote extends StatelessWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? _noteTitle;
    String? _note;
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('メモを追加'),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'タイトル',
              labelText: 'タイトル',
              border: OutlineInputBorder(),
            ),
            onChanged: (String? value) {
              _noteTitle = value;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'ノート',
              labelText: 'ノート',
              border: OutlineInputBorder(),
            ),
            onChanged: (String? value) {
              _note = value;
            },
          ),
          ElevatedButton(
            child: const Text('追加'),
            onPressed: () async {
              await FirebaseFirestore.instance.collection(uid).doc('note').collection('note').doc(_noteTitle).set({
                'title' : _noteTitle,
                'note' : _note,
              });
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Icon(Icons.clear),
      ),
    );
  }
}
