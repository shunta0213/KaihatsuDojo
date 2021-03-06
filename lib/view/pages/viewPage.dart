import 'package:flutter/material.dart';
import 'package:kaihatsudojo/const/color.dart';
import 'package:kaihatsudojo/const/images.dart';

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
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Color(0xFFFFFDE7), Color(0xFFFFECB3)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomRight),
                      boxShadow: const [
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
                        image: MyImage.cow,
                      ),
                    ),
                    margin: const EdgeInsets.only(
                        left: 50, right: 30, top: 90, bottom: 20)),
                onTap: () {
                  Navigator.of(context).pushNamed('/cow');
                },
              ),
              GestureDetector(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [Color(0xFFFFFDE7), Color(0xFFFFECB3)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight),
                    boxShadow: const [
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
                      alignment: const Alignment(0, 0.23),
                      scale: 8.4,
                      image: MyImage.pig,
                    ),
                  ),
                  //margin: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(
                      left: 30, right: 50, top: 90, bottom: 20),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/pig');
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
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [Color(0xFFFFFDE7), Color(0xFFFFECB3)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight),
                    boxShadow: const [
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
                      alignment: const Alignment(0.14, 0.18),
                      scale: 8.0,
                      image: MyImage.chicken,
                    ),
                  ),
                  //margin: const EdgeInsets.all(40),
                  margin: const EdgeInsets.only(
                      left: 50, right: 30, top: 30, bottom: 30),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/chicken');
                },
              ),
              GestureDetector(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [Color(0xFFFFFDE7), Color(0xFFFFECB3)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight),
                    boxShadow: const [
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
                      alignment: const Alignment(0.15, 0.27),
                      scale: 8.55,
                      image: MyImage.fish,
                    ),
                  ),
                  //margin: const EdgeInsets.all(40),
                  margin: const EdgeInsets.only(
                      left: 30, right: 50, top: 30, bottom: 30),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/fish');
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
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [Color(0xFFFFFDE7), Color(0xFFFFECB3)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight),
                    boxShadow: const [
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
                      scale: 7.8,
                      image: MyImage.salad,
                    ),
                  ),
                  //margin: const EdgeInsets.all(40),
                  margin: const EdgeInsets.only(
                      left: 50, right: 30, top: 30, bottom: 30),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/salad');
                },
              ),
              GestureDetector(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [Color(0xFFFFFDE7), Color(0xFFFFECB3)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight),
                    boxShadow: const [
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
                      image: MyImage.soup,
                    ),
                  ),
                  // margin: const EdgeInsets.all(40),
                  margin: const EdgeInsets.only(
                      left: 30, right: 50, top: 30, bottom: 30),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/soup');
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
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [Color(0xFFFFFDE7), Color(0xFFFFECB3)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight),
                    boxShadow: const [
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
                      scale: 9.5,
                      image: MyImage.noodle,
                    ),
                  ),
                  //margin: const EdgeInsets.all(40),
                  margin: const EdgeInsets.only(
                      left: 50, right: 30, top: 30, bottom: 30),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/noodle');
                },
              ),
              GestureDetector(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [Color(0xFFFFFDE7), Color(0xFFFFECB3)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight),
                    boxShadow: const [
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
                      image: MyImage.others,
                    ),
                  ),
                  //margin: const EdgeInsets.all(40),
                  margin: const EdgeInsets.only(
                      left: 30, right: 50, top: 30, bottom: 30),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/others');
                },
              )
            ]),
      ]),

      // BottomBar 部分
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          if (_currentIndex == index) {
            null;
          } else {
            _currentIndex = index;
            Navigator.of(context).pushReplacementNamed(pages[_currentIndex]);
          }
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
    );
  }
}
