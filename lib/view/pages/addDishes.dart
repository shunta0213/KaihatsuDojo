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
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFFFFFDE7), Color(0xFFFFECB3)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter)),
        ),
        title: const Text('                メニュー追加',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 110,
            ),
            const Text(
              'ジャンル',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            Container(
              margin: const EdgeInsets.only(top: 0, bottom: 8),
              width: 300,
              height: 61,
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          const BorderSide(color: Colors.black12, width: 6)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Color(0xFFFFE082),
                        width: 5,
                      )),
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
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),
            Container(
              margin: const EdgeInsets.only(top: 0, bottom: 28),
              width: 300,
              height: 60,
              child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(color: Colors.black12, width: 6)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color(0xFFFFE082),
                          width: 5,
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
              style: TextStyle(fontSize: 17, color: Colors.black87),
            ),
            Container(
              margin: const EdgeInsets.only(left: 45, right: 45, bottom: 55),
              child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 7,
                  minLines: 5,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(30),
                    prefixIcon: const Icon(
                      Icons.message,
                      color: Colors.black45,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(color: Colors.black12, width: 6)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color(0xFFFFE082),
                          width: 5,
                        )),
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
            Container(
              height: 58,
              width: 58,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.greenAccent, Colors.green],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 0.00005,
                    blurRadius: 10,
                    offset: Offset(5.59, 7.5),
                  ),
                ],
              ),
              child: MaterialButton(
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
                textColor: Colors.white,
                shape: const CircleBorder(),
              ),
            ),
          ],
        ),
        // ),
        //勘違いしそう
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: Container(
        //   padding: const EdgeInsets.only(bottom: 10.0),
        //   child: FloatingActionButton(
        //     child: const Icon(Icons.clear),
        //     onPressed: () => Navigator.of(context).pop(),
        //   ),
      ),
    );
  }
}
