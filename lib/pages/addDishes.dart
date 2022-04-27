import 'package:flutter/material.dart';
import 'package:kaihatsudojo/pages/top.dart';

class AddDishes extends StatefulWidget {
  const AddDishes({Key? key}) :super(key: key);

  @override
  State<AddDishes> createState() => _AddDishesState();
}

class _AddDishesState extends State<AddDishes> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('AddDishes'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: EdgeInsets.only(bottom: 10.0),
        child: FloatingActionButton(
          child: Icon(Icons.clear),
          onPressed: () => Navigator.of(context).pop() ,
        ),
      ),
    );
  }
}
