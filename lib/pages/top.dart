import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:kaihatsudojo/pages/home.dart';
import 'package:kaihatsudojo/pages/viewPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}



class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  List<Widget> _date = [Home(), ViewPage()];

  void _onTapped (int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return _date[index];
          },
        );
      },
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home_filled,
              size: 30,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
              label: 'List',
              icon: Icon(
                Icons.list_alt_rounded,
                size: 30,
                color: Colors.black,
              )),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTapped,
      ),
    );
  }
}
