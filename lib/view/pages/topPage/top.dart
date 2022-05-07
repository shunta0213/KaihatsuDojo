import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kaihatsudojo/view/drawer/drawer.dart';
import 'package:kaihatsudojo/view/pages/topPage/date.dart';
import 'package:kaihatsudojo/view/pages/topPage/todayDishList.dart';
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

    final DateTime now = DateTime.now();
    final DateFormat outputFormat = DateFormat('dd');
    final DateFormat outputFormat2 = DateFormat('E');
    final DateFormat outputFormat3 = DateFormat('yyyy.MM');
    final String date = outputFormat.format(now);
    final String youbi = outputFormat2.format(now);
    final String year = outputFormat3.format(now);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DateWidget(year: year, youbi: youbi, date: date),
            const TopDishesList(),
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
        onPressed: () => Navigator.pushNamed(context, '/addDishes'),
      ),
      drawer: MyDrawer(
        user: user,
      ),
      extendBodyBehindAppBar: true,
    );
  }
}
