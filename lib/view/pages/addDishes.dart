import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kaihatsudojo/model/addDishes.dart';

class AddDishes extends StatefulWidget {
  const AddDishes({Key? key}) : super(key: key);

  @override
  State<AddDishes> createState() => _AddDishesState();
}

class _AddDishesState extends State<AddDishes> {
  String? isSelectedItem = '牛肉';
  String? message = '';
  String? food = '';
  final DateTime now = DateTime.now();
  final DateFormat formattedDate = DateFormat('yyyy-MM-dd');
  final FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final String uid = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              'ジャンル',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 0, bottom: 30),
              width: 200,
              height: 70,
              child: DropdownButtonFormField(
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                    borderSide: BorderSide(
                      color: Colors.orange,
                    ),
                  ),
                ),
                items: const [
                  DropdownMenuItem(
                    child: Text('牛肉'),
                    value: '牛肉',
                  ),
                  DropdownMenuItem(
                    child: Text('豚肉'),
                    value: '豚肉',
                  ),
                  DropdownMenuItem(
                    child: Text('鶏肉'),
                    value: '鶏肉',
                  ),
                  DropdownMenuItem(
                    child: Text('魚類'),
                    value: '魚類',
                  ),
                  DropdownMenuItem(
                    child: Text('副菜'),
                    value: '副菜',
                  ),
                  DropdownMenuItem(
                    child: Text('汁物'),
                    value: '汁物',
                  ),
                  DropdownMenuItem(
                    child: Text('麺類'),
                    value: '麺類',
                  ),
                  DropdownMenuItem(
                    child: Text('その他'),
                    value: 'その他',
                  ),
                ],
                onChanged: (String? value) {
                  setState(() {
                    isSelectedItem = value;
                  });
                },
                value: isSelectedItem,
              ),
            ),
            const Text(
              'メニュー名',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 0, bottom: 30),
              width: 200,
              height: 60,
              child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.orange,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.orange,
                        )),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '文字を入力してください';
                    }
                    return null;
                  },
                  onChanged: (word) {
                    food = word;
                  }),
            ),
            const Text(
              'メモ',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 6,
                  minLines: 3,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(30),
                    prefixIcon: Icon(
                      Icons.message,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orange,
                      ),
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '文字を入力してください';
                    }
                    return null;
                  },
                  onChanged: (text) {
                    message = text;
                  }),
            ),
            MaterialButton(
              onPressed: () {
                addDishes(
                  context,
                  uid: uid,
                  dishName: food!,
                  genre: isSelectedItem!,
                  notes: message!,
                  now: now,
                );
              },
              child: const Icon(Icons.check),
              padding: const EdgeInsets.all(16),
              color: Colors.orange,
              textColor: Colors.white,
              shape: const CircleBorder(),
            ),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: FloatingActionButton(
          child: const Icon(Icons.clear),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
