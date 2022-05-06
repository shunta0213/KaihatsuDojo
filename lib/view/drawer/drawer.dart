import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kaihatsudojo/const/drawer/drawerDecoration.dart';

import 'package:kaihatsudojo/model/drawer/userData.dart';

class MyDrawer extends Drawer {
  final User user;

  const MyDrawer({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = FirebaseFirestore.instance.collection(user.uid);

    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.white],
          ),
        ),
        child: ListView(children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: DrawerDecoration.boxDecoration,
            accountName: UserName(userData: userData),
            accountEmail: Text(user.email!),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                  "https://cdn-icons-png.flaticon.com/512/2663/2663026.png"),
            ),
          ),
          ListTile(
            title: const Text("メモ"),
            subtitle: const Text("入力"),
            leading: const Padding(
              padding: EdgeInsets.all(8.0), // マージンの設定
              child: Icon(Icons.edit), // アイコンの種類
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/note');
            },
          ),
          ListTile(
            title: const Text("ぶたのちょきんばこ"),
            subtitle: const Text("今月の食費"),
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.savings),
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => {print("今月の食費を調べます")},
          ),
          ListTile(
            title: const Text("検索"),
            subtitle: const Text("クックパッドで探す"),
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => {print("クックパッドで検索します")},
          ),
          ListTile(
            title: const Text("検索"),
            subtitle: const Text("Instagramで探す"),
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(FontAwesomeIcons.instagram),
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => {print("Instagramで検索します")},
          ),
          ListTile(
            title: const Text("検索"),
            subtitle: const Text("Twitterで探す"),
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(FontAwesomeIcons.twitter),
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => {print("Twitterで検索します")},
          ),
          ListTile(
            title: const Text("電子書籍"),
            subtitle: const Text("オレンジページで探す"),
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.menu_book),
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => {print("オレンジページで検索します")},
          ),
          ListTile(
            title: const Text("使い方ガイド"),
            subtitle: const Text("このアプリの使い方"),
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.help_outline),
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: ()  {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/guide');
            },
          ),
          ListTile(
            title: const Text("ログアウト"),
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.logout),
            ),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacementNamed('/loginPage');
            },
          )
        ]),
      ),
    );
  }
}
