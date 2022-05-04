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
      backgroundColor: Colors.white,
      body: Column(children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFFFFFDE7), Color(0xFFFFECB3)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomRight),
                      boxShadow: [
                        BoxShadow(
                          //color: Color(0xFFFFF9C4), //色
                          color: Colors.black12,
                          spreadRadius: 0.00005,
                          blurRadius: 10,
                          offset: Offset(5.59, 7.5),
                        ),
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        scale: 8.2,
                        image: NetworkImage(
                            // 'https://stockmaterial.net/wp/wp-content/uploads/img/animal_cow02_01.png',
                            'https://cdn-icons.flaticon.com/png/512/2396/premium/2396640.png?token=exp=1651667671~hmac=5618dcee04247a4a7e8784ace5d0032d'),
                      ),
                    ),
                    margin: const EdgeInsets.only(
                        left: 50, right: 30, top: 90, bottom: 20)),
                onTap: () {
                  print('牛肉');
                },
              ),
              GestureDetector(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFFFFDE7), Color(0xFFFFECB3)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight),
                    boxShadow: [
                      BoxShadow(
                        //color: Color(0xFFFFF9C4), //色
                        color: Colors.black12,
                        spreadRadius: 0.00005,
                        blurRadius: 10,
                        offset: Offset(5.59, 7.5),
                      ),
                    ],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      alignment: Alignment(0, 0.155),
                      scale: 8.2,
                      image: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/2174/2174069.png'
                          //'https://stockmaterial.net/wp/wp-content/uploads/img/animal_pig01_01.png',
                          ),
                    ),
                  ),
                  //margin: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(
                      left: 30, right: 50, top: 90, bottom: 20),
                ),
                onTap: () {
                  print('豚肉');
                },
              )
            ]),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFFFFDE7), Color(0xFFFFECB3)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight),
                    boxShadow: [
                      BoxShadow(
                        //color: Color(0xFFFFF9C4), //色
                        color: Colors.black12,
                        spreadRadius: 0.00005,
                        blurRadius: 10,
                        offset: Offset(5.59, 7.5),
                      ),
                    ],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      alignment: Alignment(0.00, 0.18),
                      scale: 8.0,
                      image: NetworkImage(
                          // 'https://cdn-icons-png.flaticon.com/512/2695/2695783.png',
                          'https://cdn-icons.flaticon.com/png/512/2351/premium/2351188.png?token=exp=1651673084~hmac=e4db398e25872cb25fa228aca684bf64'

                          //'https://cdn-icons.flaticon.com/png/512/2351/premium/2351188.png?token=exp=1651668085~hmac=9fb77c6a1ec69a75f2bd18ef28e1bdf1'
                          //'https://stockmaterial.net/wp/wp-content/uploads/img/animal_chicken01_01.png',
                          ),
                    ),
                  ),
                  //margin: const EdgeInsets.all(40),
                  margin: const EdgeInsets.only(
                      left: 50, right: 30, top: 30, bottom: 30),
                ),
                onTap: () {
                  print('鶏肉');
                },
              ),
              GestureDetector(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFFFFDE7), Color(0xFFFFECB3)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight),
                    boxShadow: [
                      BoxShadow(
                        //color: Color(0xFFFFF9C4), //色
                        color: Colors.black12,
                        spreadRadius: 0.00005,
                        blurRadius: 10,
                        offset: Offset(5.59, 7.5),
                      ),
                    ],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      alignment: Alignment(0.15, 0.18),
                      scale: 8.2,
                      image: NetworkImage(
                          'https://cdn-icons.flaticon.com/png/512/2929/premium/2929546.png?token=exp=1651668237~hmac=f86b3412b6a5403494d83ec187f6a4f6'
                          // 'https://stockmaterial.net/wp/wp-content/uploads/img/animal_red_snapper01_01.png',
                          ),
                    ),
                  ),
                  //margin: const EdgeInsets.all(40),
                  margin: const EdgeInsets.only(
                      left: 30, right: 50, top: 30, bottom: 30),
                ),
                onTap: () {
                  print('魚');
                },
              )
            ]),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFFFFDE7), Color(0xFFFFECB3)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight),
                    boxShadow: [
                      BoxShadow(
                        //color: Color(0xFFFFF9C4), //色
                        color: Colors.black12,
                        spreadRadius: 0.00005,
                        blurRadius: 10,
                        offset: Offset(5.59, 7.5),
                      ),
                    ],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      scale: 7.5,
                      image: NetworkImage(
                          'https://cdn-icons.flaticon.com/png/512/2515/premium/2515263.png?token=exp=1651668329~hmac=1283767729fff7d517075aec41c06bcc'
                          //'https://stockmaterial.net/wp/wp-content/uploads/img/food_breakfast01_01.png',
                          ),
                    ),
                  ),
                  //margin: const EdgeInsets.all(40),
                  margin: const EdgeInsets.only(
                      left: 50, right: 30, top: 30, bottom: 30),
                ),
                onTap: () {
                  print('副菜');
                },
              ),
              GestureDetector(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFFFFDE7), Color(0xFFFFECB3)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight),
                    boxShadow: [
                      BoxShadow(
                        //color: Color(0xFFFFF9C4), //色
                        color: Colors.black12,
                        spreadRadius: 0.00005,
                        blurRadius: 10,
                        offset: Offset(5.59, 7.5),
                      ),
                    ],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      scale: 8.2,
                      image: NetworkImage(
                        'https://cdn-icons.flaticon.com/png/512/2387/premium/2387954.png?token=exp=1651668364~hmac=23a78712b92eb3e08f1340b7450e408c',
                      ),
                    ),
                  ),
                  // margin: const EdgeInsets.all(40),
                  margin: const EdgeInsets.only(
                      left: 30, right: 50, top: 30, bottom: 30),
                ),
                onTap: () {
                  print('スープ');
                },
              )
            ]),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFFFFDE7), Color(0xFFFFECB3)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight),
                    boxShadow: [
                      BoxShadow(
                        //color: Color(0xFFFFF9C4), //色
                        color: Colors.black12,
                        spreadRadius: 0.00005,
                        blurRadius: 10,
                        offset: Offset(5.59, 7.5),
                      ),
                    ],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      scale: 9.2,
                      image: NetworkImage(
                          'https://cdn-icons.flaticon.com/png/512/751/premium/751086.png?token=exp=1651668426~hmac=7561c3b7cb31370e3fcffb304deb93f0'),
                    ),
                  ),
                  //margin: const EdgeInsets.all(40),
                  margin: const EdgeInsets.only(
                      left: 50, right: 30, top: 30, bottom: 30),
                ),
                onTap: () {
                  print('麺類');
                },
              ),
              GestureDetector(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFFFFDE7), Color(0xFFFFECB3)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight),
                    boxShadow: [
                      BoxShadow(
                        //color: Color(0xFFFFF9C4), //色
                        color: Colors.black12,
                        spreadRadius: 0.00005,
                        blurRadius: 10,
                        offset: Offset(5.59, 7.5),
                      ),
                    ],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      scale: 8.2,
                      image: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/3649/3649227.png'),
                    ),
                  ),
                  //margin: const EdgeInsets.all(40),
                  margin: const EdgeInsets.only(
                      left: 30, right: 50, top: 30, bottom: 30),
                ),
                onTap: () {
                  print('その他');
                },
              )
            ]),
      ]),
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
        backgroundColor: Color(0xFFFFD54F),
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
