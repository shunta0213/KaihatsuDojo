import 'package:flutter/material.dart';
import 'package:kaihatsudojo/preparation/color.dart';

class AddDishes extends StatefulWidget {
  const AddDishes({Key? key}) : super(key: key);

  @override
  State<AddDishes> createState() => _AddDishesState();
}

class _AddDishesState extends State<AddDishes> {
  String? isSelectedItem = '鶏肉';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kOrangeColor4,
        title: const Text('DopdownButton Sample'),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(40)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 0, bottom: 4),
                  width: 300,
                  height: 70,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(20.0),
                        ),
                        borderSide: BorderSide(
                          color: Colors.orange,
                        ),
                      ),
                    ),

                    items: const [
                      DropdownMenuItem(
                        child: Text('牛肉'),
                        value: '牛肉',
                      ),
                      DropdownMenuItem(
                        child: Text('豚肉'),
                        value: '豚肉',
                      ),
                      DropdownMenuItem(
                        child: Text('鶏肉'),
                        value: '鶏肉',
                      ),
                      DropdownMenuItem(
                        child: Text('魚類'),
                        value: '魚類',
                      ),
                      DropdownMenuItem(
                        child: Text('副菜'),
                        value: '副菜',
                      ),
                      DropdownMenuItem(
                        child: Text('汁物'),
                        value: '汁物',
                      ),
                      DropdownMenuItem(
                        child: Text('麺類'),
                        value: '麺類',
                      ),
                      DropdownMenuItem(
                        child: Text('その他'),
                        value: 'その他',
                      ),
                    ],

                    //6
                    onChanged: (String? value) {
                      setState(() {
                        isSelectedItem = value;
                      });
                    },
                    //7
                    value: isSelectedItem,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0, bottom: 8),
                  width: 300,
                  height: 70,
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.orange,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.orange,
                          )),
                    ),
                  ),
                ),
                Container(
                    width: 300,
                    height: 100,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.message,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    )),
                Container(
                  child: Material(
                    color: Colors.lightGreen,
                    shape: CircleBorder(
                      side: BorderSide(),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: Container(
      //   padding: const EdgeInsets.only(bottom: 10.0),
      //   child: FloatingActionButton(
      //     backgroundColor: Colors.amber,
      //     child: const Icon(Icons.clear),
      //     onPressed: () => Navigator.of(context).pop(),
      //   ),
    );
  }
}

//入力しようとしたら画面外に行っちゃったのでいじりました
