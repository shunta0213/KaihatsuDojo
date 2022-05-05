import 'package:flutter/cupertino.dart';
import 'package:kaihatsudojo/const/images.dart';

import 'package:kaihatsudojo/view/authentication/singIn.dart';
import 'package:kaihatsudojo/view/dishList/dishList.dart';
import 'package:kaihatsudojo/view/top.dart';
import 'package:kaihatsudojo/view/addDishes.dart';
import 'package:kaihatsudojo/view/viewPage.dart';
import 'package:kaihatsudojo/view/authentication/singUp.dart';

class PageRoutes {
  static Map<String, Widget Function(BuildContext)> pageRoutes = {
    '/loginPage': (context) => const LoginPage(),
    '/signUpPage': (context) => const SignUpPage(),
    '/mainPage': (BuildContext context) => const TopPage(),
    '/addDishes': (BuildContext context) => const AddDishes(),
    '/viewPage': (BuildContext context) => const ViewPage(),
    '/cow':(BuildContext context) => ListPage(genre: '牛', icon: ImagesWidget.cow),
    '/pig':(BuildContext context) => ListPage(genre: '豚', icon: ImagesWidget.pig),
    '/chicken':(BuildContext context) => ListPage(genre: '鶏', icon: ImagesWidget.chicken),
    '/fish':(BuildContext context) => ListPage(genre: '魚', icon: ImagesWidget.fish),
    '/salad':(BuildContext context) => ListPage(genre: 'サラダ', icon: ImagesWidget.salad),
    '/soup':(BuildContext context) => ListPage(genre: '汁物', icon: ImagesWidget.soup),
    '/noodle':(BuildContext context) => ListPage(genre: '麺', icon: ImagesWidget.noodle),
    '/others':(BuildContext context) => ListPage(genre: 'その他', icon: ImagesWidget.others),

  };
}
