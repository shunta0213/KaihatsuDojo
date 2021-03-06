import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kaihatsudojo/const/drawer/drawerDecoration.dart';
import 'package:kaihatsudojo/model/drawer/urlJump.dart';
import 'package:kaihatsudojo/view/drawer/userData.dart';

import 'package:kaihatsudojo/const/icons/icons.dart';

class MyDrawer extends Drawer {
  final User user;

  const MyDrawer({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: DrawerDecoration.boxDecoration,
            accountName: const UserName(),
            accountEmail: Text(
              user.email!,
              style: const TextStyle(color: Colors.black87, fontSize: 14),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Color(0xFFFFF8E1),
              backgroundImage: NetworkImage(
                  "https://cdn-icons-png.flaticon.com/512/2663/2663026.png"),
            ),
          ),
          ListTile(
            title: const Text(
              "メモ",
              style: TextStyle(fontFamily: 'NotoSansJP'),
            ),
            subtitle: const Text(
              "入力",
              style: TextStyle(fontFamily: 'NotoSansJP'),
            ),
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
            title: const Text(
              "検索",
              style: TextStyle(fontFamily: 'NotoSansJP'),
            ),
            subtitle: const Text(
              "クックパッドで探す",
              style: TextStyle(fontFamily: 'NotoSansJP'),
            ),
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => urlJump('https://cookpad.com/'),
          ),
          ListTile(
            title: const Text(
              "検索",
              style: TextStyle(fontFamily: 'NotoSansJP'),
            ),
            subtitle: const Text(
              "Instagramで探す",
              style: TextStyle(fontFamily: 'NotoSansJP'),
            ),
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: MyIcons.instagram,
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => urlJump('https://www.instagram.com/'),
          ),
          ListTile(
            title: const Text(
              "検索",
              style: TextStyle(fontFamily: 'NotoSansJP'),
            ),
            subtitle: const Text(
              "Twitterで探す",
              style: TextStyle(fontFamily: 'NotoSansJP'),
            ),
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: MyIcons.twitter,
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => urlJump('https://twitter.com/?lang=ja'),
          ),
          ListTile(
            title: const Text(
              "電子書籍",
              style: TextStyle(fontFamily: 'NotoSansJP'),
            ),
            subtitle: const Text(
              "オレンジページで探す",
              style: TextStyle(fontFamily: 'NotoSansJP'),
            ),
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.menu_book),
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => urlJump('https://www.orangepage.net/'),
          ),
          ListTile(
            title: const Text(
              "健康に関する記事",
              style: TextStyle(fontFamily: 'NotoSansJP'),
            ),
            subtitle: const Text(
              "ウェブサイトで見る",
              style: TextStyle(fontFamily: 'NotoSansJP'),
            ),
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.article),
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => urlJump('https://www.lotte.co.jp/medipalette/'),
          ),
          ListTile(
            title: const Text(
              "使い方ガイド",
              style: TextStyle(fontFamily: 'NotoSansJP'),
            ),
            subtitle: const Text(
              "このアプリの使い方",
              style: TextStyle(fontFamily: 'NotoSansJP'),
            ),
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.help_outline),
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/guide');
            },
          ),
          ListTile(
            title: const Text(
              "ログアウト",
              style: TextStyle(fontFamily: 'NotoSansJP'),
            ),
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.logout),
            ),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacementNamed('/loginPage');
            },
          )
        ],
      ),
    );
  }
}

class FontAwesomeIcons {}
