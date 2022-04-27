import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:kaihatsudojo/pages/home.dart';
import 'package:kaihatsudojo/pages/viewPage.dart';
import 'package:kaihatsudojo/pages/addDishes.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  Icon _homeIcon = const Icon(Icons.home);

  List<Widget> _date = [Home(), ViewPage()];

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void iconChange() {
    setState(() {
      if (_selectedIndex == 0) {
         _homeIcon = const Icon(Icons.home_outlined, size: 30,);
      } else {
         _homeIcon = const Icon(Icons.home, size: 30,);
      }
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
        height: 50,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Home',
            icon: _homeIcon,
          ),
          BottomNavigationBarItem(
              label: 'List',
              icon: Icon(
                Icons.list_alt_rounded,
                size: 30,
              )),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTapped,
      ),
    );
  }
}
