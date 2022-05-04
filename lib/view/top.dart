import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kaihatsudojo/preparation/color.dart';
import 'package:kaihatsudojo/preparation/header.dart';
import 'viewPage.dart';

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

    return Scaffold(
      // 基本はここに書いていく
      //下のやついったん置いておかせてください
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Text(uid),
      //   ],
      // ),

      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0xFFFFAFAFA),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              beauty_header(),
              Text(uid), //ここいじりました。沼澤
            ],
          ),
        ),
      ),

      // BottomBar部分
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          //   _currentIndex = index;
          //   Navigator.of(context).pushReplacementNamed(pages[_currentIndex]);
          // },
          Navigator.push(
            context,
            //   MaterialPageRoute(
            //     builder: (context) {
            //       return MyApp2();
            //     },
            //   ),
            // );
            PageRouteBuilder(
              transitionDuration: Duration(seconds: 0),
              transitionsBuilder: (context, animation, animationTime, child) {
                // animation = CurvedAnimation(
                //     parent: animation, curve: Curves.easeInCirc);
                return ScaleTransition(
                  scale: animation,
                  alignment: Alignment.center,
                  child: child,
                );
              },
              pageBuilder: (context, animation, animationTime) {
                return ViewPage();
              },
            ),
          );
        },
        items: barItem,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 2,
        backgroundColor: kFABButtonColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => Navigator.pushNamed(context, '/addDishes'),
      ),
    );
  }
}
