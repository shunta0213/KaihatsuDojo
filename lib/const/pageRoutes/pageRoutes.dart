import 'package:flutter/cupertino.dart';
import 'package:kaihatsudojo/const/images.dart';

import 'package:kaihatsudojo/view/authentication/singIn.dart';
import 'package:kaihatsudojo/view/dishList/dishList.dart';
import 'package:kaihatsudojo/view/drawerPages/guide.dart';
import 'package:kaihatsudojo/view/drawerPages/note/addNote.dart';
import 'package:kaihatsudojo/view/drawerPages/note/note.dart';
import 'package:kaihatsudojo/view/topPage/top.dart';
import 'package:kaihatsudojo/view/pages/addDishes.dart';
import 'package:kaihatsudojo/model/userCheck.dart';
import 'package:kaihatsudojo/view/pages/viewPage.dart';
import 'package:kaihatsudojo/view/authentication/singUp.dart';

class PageRoutes {
  static Map<String, Widget Function(BuildContext)> pageRoutes = {
    '/': (BuildContext context) => userCheck(context),
    '/loginPage': (BuildContext context) => const LoginPage(),
    '/signUpPage': (BuildContext context) => const SignUpPage(),
    '/mainPage': (BuildContext context) => const TopPage(),
    '/addDishes': (BuildContext context) => const AddDishes(),
    '/viewPage': (BuildContext context) => const ViewPage(),

    // For DishList
    '/cow':(BuildContext context) => ListPage(genre: '牛肉', icon: ImagesWidget.cow),
    '/pig':(BuildContext context) => ListPage(genre: '豚肉', icon: ImagesWidget.pig),
    '/chicken':(BuildContext context) => ListPage(genre: '鶏肉', icon: ImagesWidget.chicken),
    '/fish':(BuildContext context) => ListPage(genre: '魚類', icon: ImagesWidget.fish),
    '/salad':(BuildContext context) => ListPage(genre: '副菜', icon: ImagesWidget.salad),
    '/soup':(BuildContext context) => ListPage(genre: '汁物', icon: ImagesWidget.soup),
    '/noodle':(BuildContext context) => ListPage(genre: '麺類', icon: ImagesWidget.noodle),
    '/others':(BuildContext context) => ListPage(genre: 'その他', icon: ImagesWidget.others),

    // For Drawer Page
    '/note' : (BuildContext context) => const Note(),
    '/guide' : (BuildContext context) => const Guide(),


  };
}
