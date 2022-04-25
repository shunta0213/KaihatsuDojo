import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:kaihatsu_test/main.dart';
import 'package:kaihatsu_test/login_form.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<DropdownMenuItem<String>> _ingredients = [];

  @override
  void initState() {
    super.initState();
    setItems();
  }

  void setItems() {
    _ingredients
      ..add(DropdownMenuItem(child: Text('item')),)
      ..add(DropdownMenuItem(child: Text('item2')));
  }

  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final db = FirebaseFirestore.instance;
    final uid = auth.currentUser!.uid;

    String _genre = "";
    String _dishName = "";
    List _dbIngredients = [];
    int _date = 20220401;

    final DocumentReference dbUser = db.collection("user").doc(uid);

    Future<void> addDishes() {
      return dbUser
          .collection(_genre)
          .doc(_dishName)
          .set({
        'name': _dishName,
        'ingredients': _dbIngredients,
        'date': _date,
      })
          .then((value) => null)
          .catchError((error) => null);
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Menu Name',
                labelText: 'Menu Name',
              ),
              onChanged: (String? dishName) {
                _dishName = dishName!;
              },
            ),
            DropdownButton(
              items: _ingredients,
              value: _dbIngredients,
              onChanged: (value) {
                setState(() {
                  _dbIngredients.add(value);
                });
              },
            ),
            TextButton(onPressed:() => print(_ingredients), child: Text('Add Dish'))
          ],
        ),
      ),
    );
  }
}
