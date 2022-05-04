import 'package:flutter/material.dart';
import 'package:kaihatsudojo/const/color.dart';
import 'package:kaihatsudojo/const/header.dart';

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
      backgroundColor: Colors.deepOrange[100],
      body: Column(
          children: <Widget> [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    child:Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFFF59D), //始まりの色
                            Color(0xFFFFF9C4), //終わりの色
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFFFF9C4), //色
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(1, 1),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://stockmaterial.net/wp/wp-content/uploads/img/animal_cow02_01.png',
                          ),
                        ),
                      ),
                      margin: const EdgeInsets.all(40),
                    ),
                    onTap: () {
                      print('牛肉');
                    },
                  ),
                  GestureDetector(
                    child:Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFFF59D), //始まりの色
                            Color(0xFFFFF9C4), //終わりの色
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFFFF9C4), //色
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(1, 1),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://stockmaterial.net/wp/wp-content/uploads/img/animal_pig01_01.png',
                          ),
                        ),
                      ),
                      margin: const EdgeInsets.all(40),
                    ),
                    onTap: () {
                      print('豚肉');
                    },
                  )
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    child:Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFFF59D), //始まりの色
                            Color(0xFFFFF9C4), //終わりの色
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFFFF9C4), //色
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(1, 1),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://stockmaterial.net/wp/wp-content/uploads/img/animal_chicken01_01.png',
                          ),
                        ),
                      ),
                      margin: const EdgeInsets.all(40),
                    ),
                    onTap: () {
                      print('鶏肉');
                    },
                  ),
                  GestureDetector(
                    child:Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFFF59D), //始まりの色
                            Color(0xFFFFF9C4), //終わりの色
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFFFF9C4), //色
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(1, 1),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://stockmaterial.net/wp/wp-content/uploads/img/animal_red_snapper01_01.png',
                          ),
                        ),
                      ),
                      margin: const EdgeInsets.all(40),
                    ),
                    onTap: () {
                      print('魚');
                    },
                  )
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    child:Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFFF59D), //始まりの色
                            Color(0xFFFFF9C4), //終わりの色
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFFFF9C4), //色
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(1, 1),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://stockmaterial.net/wp/wp-content/uploads/img/food_breakfast01_01.png',
                          ),
                        ),
                      ),
                      margin: const EdgeInsets.all(40),
                    ),
                    onTap: () {
                      print('副菜');
                    },
                  ),
                  GestureDetector(
                    child:Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFFF59D), //始まりの色
                            Color(0xFFFFF9C4), //終わりの色
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFFFF9C4), //色
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(1, 1),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            '',
                          ),
                        ),
                      ),
                      margin: const EdgeInsets.all(40),
                    ),
                    onTap: () {
                      print('スープ');
                    },
                  )
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    child:Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFFF59D), //始まりの色
                            Color(0xFFFFF9C4), //終わりの色
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFFFF9C4), //色
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(1, 1),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://stockmaterial.net/wp/wp-content/uploads/img/animal_cow02_01.png',
                          ),
                        ),
                      ),
                      margin: const EdgeInsets.all(40),
                    ),
                    onTap: () {
                      print('麺類');
                    },
                  ),
                  GestureDetector(
                    child:Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFFF59D), //始まりの色
                            Color(0xFFFFF9C4), //終わりの色
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFFFF9C4), //色
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(1, 1),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://stockmaterial.net/wp/wp-content/uploads/img/animal_pig01_01.png',
                          ),
                        ),
                      ),
                      margin: const EdgeInsets.all(40),
                    ),
                    onTap: () {
                      print('その他');
                    },
                  )
                ]
            ),
          ]
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
          _currentIndex = index;
          Navigator.of(context).pushReplacementNamed(pages[_currentIndex]);
        },
        //   Navigator.push(
        //     context,
        //     //   MaterialPageRoute(
        //     //     builder: (context) {
        //     //       return MyApp2();
        //     //     },
        //     //   ),
        //     // );
        //     PageRouteBuilder(
        //       transitionDuration: Duration(seconds: 0),
        //       transitionsBuilder: (context, animation, animationTime, child) {
        //         // animation = CurvedAnimation(
        //         //     parent: animation, curve: Curves.easeInCirc);
        //         return ScaleTransition(
        //           scale: animation,
        //           alignment: Alignment.center,
        //           child: child,
        //         );
        //       },
        //       pageBuilder: (context, animation, animationTime) {
        //         return TopPage();
        //       },
        //     ),
        //   );
        // },
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