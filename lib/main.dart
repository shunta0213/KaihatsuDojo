import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kaihatsudojo/view/authentication/singIn.dart';
import 'package:kaihatsudojo/const/pageRoutes.dart';
import 'package:kaihatsudojo/model/transitionBuilder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // for debug
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        backgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white.withOpacity(0.8),
          elevation: 0,
        ),
        // PageTransitionCustomize
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: CustomTransitionBuilder(),
          }
        ),
      ),
      routes: PageRoutes.pageRoutes,
      home: const LoginPage(),
    );
  }
}
