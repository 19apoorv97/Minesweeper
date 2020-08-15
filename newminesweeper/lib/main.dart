import 'package:flutter/material.dart';
import 'package:newminesweeper/screens/rules.dart';
import 'package:newminesweeper/screens/welcome.dart';
import 'package:newminesweeper/utilities/board.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id:(context)=>WelcomeScreen(),
        Rules.id:(context)=>Rules(),
        Board.id:(context)=>Board()
      },
    );
  }
}