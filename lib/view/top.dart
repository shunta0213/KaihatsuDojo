import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  int _currentIndex = 0;
  List<String> pages = ['/TopPage', '/viewPage'];

  @override
  Widget build(BuildContext context) {
    // For Firebase Auth and Firestore
    final auth = FirebaseAuth.instance;
    final db = FirebaseFirestore.instance;
    final uid = auth.currentUser!.uid;

    // For Bottom Bar
    bool _currentIndexColor = true;
    setState(() {
      if (_currentIndex == 0) {
        _currentIndexColor = true;
      } else {
        _currentIndexColor = false;
      }
    });
    List<BottomNavigationBarItem> barItem = [
      BottomNavigationBarItem(
          label: 'home',
          icon: Icon(
            Icons.home,
            size: 30,
            color: _currentIndexColor ? Colors.orange : Colors.black,
          )),
      BottomNavigationBarItem(
          label: 'list',
          icon: Icon(
            Icons.list_alt_rounded,
            size: 30,
            color: !_currentIndexColor ? Colors.orange : Colors.black,
          ))
    ];
    // end

    return Scaffold(
      // 基本はここに書いていく
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(uid),
        ],
      ),

      // BottomBar部分
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          _currentIndex = index;
          Navigator.of(context).pushReplacementNamed(pages[_currentIndex]);
        },
        items: barItem,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, '/addDishes'),
      ),
    );
  }
}
