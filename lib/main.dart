import 'package:flutter/material.dart';
import 'package:xogame/splash_screen.dart';
import 'game_screen.dart';
import 'login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        LoginScreen.routeName: (context) =>  LoginScreen(),
        GameScreen.routeName: (context) =>  GameScreen(),
      },
    );
  }
}
