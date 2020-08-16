
import 'package:flutter/material.dart';
import 'package:newminesweeper/utilities/board1.dart';
import 'package:newminesweeper/utilities/functionality.dart';

class Game extends StatefulWidget {
  static final String id='game';
  static Function gameCallBack;
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  int minesLeft;

  void GamesetState(){
    setState(() {
      minesLeft=Board.mines-Auto.blocksFlagged;
    });
  }
  
  @override
  void initState() {
    // TODO: implement initState
    minesLeft=Board.mines;
    Game.gameCallBack=GamesetState;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('MineSweeper'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Image.asset('images/flag.png',height: 60,width: 60,),
            SizedBox(width: 5,),
            Text(minesLeft.toString(),style: TextStyle(color: Colors.white,fontSize: 40)),
            SizedBox(width: 10,),
            Image.asset('images/clock.png',height: 60,width: 60,),
            SizedBox(width: 5,),
            Text('3:00',style: TextStyle(color: Colors.white,fontSize: 40)),
            
          ],),
          SizedBox(height: 20,),
          Center(child: Wrap(children:[Board()],)),
          SizedBox(height: 20,),
          Material(
            elevation: 5.0,
            color: Colors.amber,
            borderRadius: BorderRadius.circular(30.0),
            child: MaterialButton(
              onPressed: (){},
              minWidth: 200.0,
              height: 42.0,
              child: Text('Submit'),
              ),
            ),
        ],
      )
    );
  }
}