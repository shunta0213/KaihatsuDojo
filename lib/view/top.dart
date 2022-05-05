import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kaihatsudojo/const/color.dart';
import 'package:kaihatsudojo/const/header.dart';
import 'package:kaihatsudojo/view/drawer/appBar.dart';
import 'package:kaihatsudojo/view/drawer/drawer.dart';
import 'viewPage.dart';
import 'package:intl/intl.dart';

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
    final User user = FirebaseAuth.instance.currentUser!;
    final db = FirebaseFirestore.instance;
    final uid = user.uid;

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
            color: _currentIndexColor ? Colors.amber : Colors.grey,
          )),
      BottomNavigationBarItem(
          label: 'list',
          icon: Icon(
            Icons.list_alt_rounded,
            size: 30,
            color: !_currentIndexColor ? Colors.amber : Colors.grey,
          ))
    ];
    // end

    DateTime now = DateTime.now();
    DateFormat outputFormat = DateFormat('dd');
    DateFormat outputFormat2 = DateFormat('E');
    DateFormat outputFormat3 = DateFormat('yyyy.MM');
    String date = outputFormat.format(now);
    String youbi = outputFormat2.format(now);
    String year = outputFormat3.format(now);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [Color(0xFFFFFDE7), Color(0xFFFFE0B2)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        //color: Color(0xFFFFF9C4), //色
                        color: Colors.black26,
                        spreadRadius: 0.00005,
                        blurRadius: 19,
                        offset: Offset(5.9, 7.5),
                      ),
                    ],
                  ),
                  width: 282.514,
                  height: 178.539,
                  margin: const EdgeInsets.only(top: 35, left: 61, right: 40),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Align(
                        alignment: const Alignment(-0.885, -0.489),
                        child: Text(
                          year,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Align(
                        alignment: const Alignment(-1, -0.042),
                        child: Text(
                          date,
                          style: const TextStyle(
                              fontSize: 66,
                              color: Colors.black54,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Align(
                        alignment: const Alignment(-0.78, 0.415),
                        child: Text(
                          youbi,
                          style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      Align(
                        alignment: const Alignment(0.85, -0.82),
                        child: Container(
                          height: 29,
                          width: 29,
                          foregroundDecoration: const BoxDecoration(
                            image: DecorationImage(
                              alignment: Alignment.center,
                              scale: 1,
                              image: NetworkImage(
                                  'https://cdn-icons-png.flaticon.com/512/6871/6871984.png'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
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
        elevation: 2,
        backgroundColor: const Color(0xFFFFD54F),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => Navigator.pushNamed(context, '/addDishes'),
      ),

      appBar: MyAppBar(),
      drawer: MyDrawer(
        user: user,
      ),
      extendBodyBehindAppBar: true,
    );
  }
}
