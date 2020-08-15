import 'package:flutter/material.dart';
import 'package:newminesweeper/utilities/board.dart';
import 'rules.dart';
class WelcomeScreen extends StatelessWidget {
  static final String id='welcome';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
          backgroundColor: Colors.teal,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Image.asset('images/girl.png')),
            SizedBox(height: 10,),
            Expanded(
              flex: 1,
              child: Text('MineSweeper',
              style: TextStyle(fontWeight: FontWeight.w900,
              fontSize: 30),
              )),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                child: RaisedButton(
                  child: Text('Start the Game'),
                  onPressed: () { 
                    Navigator.pushNamed(context, Board.id);
                   },
                  ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                child: RaisedButton(
                  child: Text('Know the Rules'),
                  onPressed: () { 
                    Navigator.pushNamed(context,Rules.id);
                   },
                  ),
              ),
            ),
          ],),
        ),
    );
  }
}