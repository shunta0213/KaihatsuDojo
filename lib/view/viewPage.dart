import 'package:flutter/material.dart';
import 'package:kaihatsudojo/preparation/color.dart';
import 'package:kaihatsudojo/preparation/header.dart';
import 'top.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    // For BottomBar
    int _currentIndex = 1;
    List<String> pages = ['/mainPage', '/viewPage'];
    bool _currentIndexColor = true;

    setState(() {
      if (_currentIndex == 0) {
        _currentIndexColor = true;
      } else {
        _currentIndexColor = false;
      }
    });
    //end

    return Scaffold(
      // 基本ここに書いていく
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Page2'),
        ],
      ),
      // body: Center(
      //   child: Container(
      //     //白の部分
      //     width: MediaQuery.of(context).size.width,
      //     height: MediaQuery.of(context).size.height,
      //     color: Color(0xFFFFAFAFA),
      //     child: Stack(
      //       fit: StackFit.expand,
      //       children: <Widget>[
      //         //背景
      //         beauty_header(),
      //         // 基本ここに書いていく
      //         Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Text('Page2'),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),

      // BottomBar 部分
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
                return TopPage();
              },
            ),
          );
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              label: 'home',
              icon: Icon(
                Icons.home,
                size: 30,
                color: _currentIndexColor ? kFABButtonColor : Colors.grey,
              )),
          BottomNavigationBarItem(
              label: 'list',
              icon: Icon(
                Icons.list_alt_rounded,
                size: 30,
                color: !_currentIndexColor ? kFABButtonColor : Colors.grey,
              ))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kFABButtonColor,
        elevation: 2,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => Navigator.pushNamed(context, '/addDishes'),
      ),
    );
  }
}
