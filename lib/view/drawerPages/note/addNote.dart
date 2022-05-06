import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kaihatsudojo/const/drawer/drawerPagesDecoration/decoration.dart';

void showAddNoteDialog(
    {required BuildContext context, required String uid}) async {
  String? note;
  String? noteTitle;
  showDialog(
      context: context,
      builder: (context) {
        return Column(
          children: <Widget>[
            AlertDialog(
              title: const Text('メモを追加'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          decoration:  InputDecoration(
                            labelText: 'タイトル',
                            hintText: null,
                            border: AddNoteDecoration.inputBorder,
                          ),
                          onChanged: (String? value) {
                            noteTitle = value;
                          },
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          decoration:  InputDecoration(
                            hintText: 'ノート',
                            labelText: 'ノート',
                            border: AddNoteDecoration.inputBorder,
                          ),
                          minLines: 10,
                          maxLines: 10,
                          onChanged: (String? value) {
                            note = value;
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('追加'),
                  onPressed: () async {
                    await FirebaseFirestore.instance
                        .collection(uid)
                        .doc('note')
                        .collection('note')
                        .doc(noteTitle)
                        .set({
                      'title': noteTitle,
                      'note': note,
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.clear),
                )
              ],
            ),
          ],
        );
      });
}
