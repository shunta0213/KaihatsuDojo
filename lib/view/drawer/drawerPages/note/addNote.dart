import 'package:flutter/material.dart';

import 'package:kaihatsudojo/const/drawer/drawerPageDecoration/decoration.dart';
import 'package:kaihatsudojo/model/noteData.dart';

void showAddNoteDialog(
    {required BuildContext context, required String uid}) async {
  String? note;
  String? noteTitle;
  showDialog(
      context: context,
      builder: (context) {
        return Column(
          children: <Widget>[
            SizedBox(
              height: 90,
            ),
            AlertDialog(
              title: const Text(
                'メモを追加',
                style: TextStyle(fontFamily: 'NotoSansJP'),
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'タイトル',
                            hintText: null,
                            border: AddNoteDecoration.inputBorder,
                          ),
                          onChanged: (String? value) {
                            noteTitle = value;
                          },
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
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
                MaterialButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      'キャンセル',
                      style: TextStyle(fontFamily: 'NotoSansJP'),
                    )),
                MaterialButton(
                  child: const Text(
                    '追加',
                    style: TextStyle(
                        fontFamily: 'NotoSansJP',
                        color: Colors.blue,
                        fontSize: 15),
                  ),
                  onPressed: () =>
                      addNote(noteTitle: noteTitle, note: note, uid: uid),
                ),
              ],
            ),
          ],
        );
      });
}
