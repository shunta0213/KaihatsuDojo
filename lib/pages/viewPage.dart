import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewPage extends StatefulWidget {
  const ViewPage ({Key? key}) : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  int _currentIndex = 1;
  List<String> pages = ['/mainPage', '/viewPage'];
  bool _currentIndexColor = true;

  @override
  Widget build(BuildContext context) {
    setState(() {
      if (_currentIndex == 0) {
        _currentIndexColor = true;
      } else {
        _currentIndexColor = false;
      }
    });
    return Scaffold(
      // 基本ここに書いていく
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Page2'),
        ],
      ),

      // BottomBar 部分
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          _currentIndex = index;
          Navigator.of(context).pushReplacementNamed(pages[_currentIndex]);
        },
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              label: 'home',
              icon: Icon(
                Icons.home,
                size: 30,
                color: _currentIndexColor ? Colors.orange :Colors.black,
              )),
          BottomNavigationBarItem(
              label: 'list',
              icon: Icon(
                Icons.list_alt_rounded,
                size: 30,
                color: !_currentIndexColor ? Colors.orange :Colors.black,
              ))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, '/addDishes'),
      ),
    );
  }
}
