import 'package:flutter/material.dart';


class AddDishes extends StatefulWidget {
  const AddDishes({Key? key}) :super(key: key);

  @override
  State<AddDishes> createState() => _AddDishesState();
}

class _AddDishesState extends State<AddDishes> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 基本はここに書いていく
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('AddDishes'),
        ],
      ),

      // Xボタン
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: FloatingActionButton(
          child: const Icon(Icons.clear),
          onPressed: () => Navigator.of(context).pop() ,
        ),
      ),
    );
  }
}
