import 'package:flutter/material.dart';
import 'package:newminesweeper/utilities/block.dart';
import 'dart:math';
import 'functionality.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:audioplayers/audio_cache.dart';

class Board extends StatefulWidget {
  static Function boardCallBack;
  static Function mineFoundCallBack;
  static final String id='board';
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  int rows=10;
  int columns=8;
  int mines=9;
  int minesLeft;
  List<int> minesCordinate=List();
  List<List<Block>> gboard; //list of widget is not a widget
  AudioCache player=AudioCache();
  void submitOnPress()
  {
    bool win=false;
    for(int i in minesCordinate){
      int r=i~/rows;
      int c=i%columns;
      if(gboard[r][c].flagged==true)
      {
        win=true;
      }
      else{
        win=false;
        break;
      }
    }
    setState(() {
          Alert(context: context, title: win==true?'You Win!':'Run!',
          image: win==true?Image.asset('images/win.png',height: 100):Image.asset('images/boyfriend.png',height: 100),
      closeFunction: (){Navigator.pop(context);
    }).show();
    });

  }
  void boardSetState(){
    setState(() {
      minesLeft=mines-Auto.blocksFlagged;
    });
  }
  void mineFound()
  {
    setState(() {
      Alert(context: context, title:'Run!',
      image: Image.asset('images/boyfriend.png',height: 100,),
      closeFunction: (){Navigator.pop(context);
      }).show();
    });
  }
  @override
  void initState() {
    player.play('intro.mp3');
    minesLeft=mines;
    Board.boardCallBack=boardSetState;
    Board.mineFoundCallBack=mineFound;
    gboard=List.generate(rows, (row) => List.generate(columns,(column) => Block()),growable: false);
    logic();
    Auto.gboard=gboard;
    Auto.rows=rows;
    Auto.columns=columns;
    Auto.actualMines=mines;
    Auto.blocksFlagged=0;
    
    //Timer(Duration(minutes: 3), callback);
    super.initState();
  }

  void logic()
  {
    int temp=mines;
    Random ran=Random();
    while(temp!=0)
    {
      int n=ran.nextInt(rows*columns);
      int r=n~/rows;
      int c=n%columns;
      if(gboard[r][c].havingMine==false)
      {
      minesCordinate.add(n);
      gboard[r][c].havingMine=true;
      temp--;
      }
    }
    for(int i=0;i<rows;i++)
    {
      for(int j=0;j<columns;j++)
      {
        gboard[i][j].xCor=i;
        gboard[i][j].yCor=j;
        if(i!=0&&j!=0&&gboard[i-1][j-1].havingMine==true)      
          gboard[i][j].minesAround++;
        
        if(i!=0&&gboard[i-1][j].havingMine==true)        
          gboard[i][j].minesAround++;
        
        if(i!=0&&j!=columns-1&&gboard[i-1][j+1].havingMine==true)
          gboard[i][j].minesAround++;

        if(j!=0&&gboard[i][j-1].havingMine==true)
          gboard[i][j].minesAround++;
        
        if(j!=columns-1&&gboard[i][j+1].havingMine==true)
          gboard[i][j].minesAround++;

        if(i!=rows-1&&j!=0&&gboard[i+1][j-1].havingMine==true)
          gboard[i][j].minesAround++;
        
        if(i!=rows-1&&gboard[i+1][j].havingMine==true)
          gboard[i][j].minesAround++;

        if(i!=rows-1&&j!=columns-1&&gboard[i+1][j+1].havingMine==true)
          gboard[i][j].minesAround++;
      }
    }
  }
  Widget buildBoard() //as Column handles 1d list buildBoard handles 2d list
  {
    List<Row> boardRow=[];
    for(int i=0;i<rows;i++)
    {
      List<Block> rowChildren=[]; 
      for(int j=0;j<columns;j++)
      {
        Block b=gboard[i][j];
        rowChildren.add(b);
      }
      boardRow.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rowChildren,
      ));
    }
    
    return Container(
      width: 402,
      color: Colors.grey[700],
      child: Column(
        children:boardRow,
      ),
    );

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
        //crossAxisAlignment: CrossAxisAlignment.stretch,
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
          Center(child: Wrap(children:[buildBoard()],)),
          SizedBox(height: 20,),
          Material(
            elevation: 5.0,
            color: Colors.amber,
            borderRadius: BorderRadius.circular(30.0),
            child: MaterialButton(
              onPressed: (){submitOnPress();},
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