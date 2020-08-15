import 'package:flutter/material.dart';
import 'package:newminesweeper/utilities/block.dart';
import 'dart:math';
import 'no_mine_detector.dart';

class Board extends StatefulWidget {
  static final String id='board';
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  int rows=10;
  int columns=8;
  int mines=9;
  
  List<List<Block>> gboard; //list of widget is not a widget
  @override
  void initState() {
    // TODO: implement initState
    gboard=List.generate(rows, (row) => List.generate(columns,(column) => Block()),growable: false);
    logic();
    Auto.boardRef=gboard;
    Auto.rows=rows;
    Auto.columns=columns;
    super.initState();
  }

  void logic()
  {
    int minesLeft=mines;
    Random ran=Random();
    while(minesLeft!=0)
    {
      int n=ran.nextInt(rows*columns);
      int r=n~/rows;
      int c=n%columns;
      if(gboard[r][c].havingBomb==false)
      {
      gboard[r][c].havingBomb=true;
      minesLeft--;
      }
    }
    for(int i=0;i<rows;i++)
    {
      for(int j=0;j<columns;j++)
      {
        gboard[i][j].xCor=i;
        gboard[i][j].yCor=j;
        if(i!=0&&j!=0&&gboard[i-1][j-1].havingBomb==true)      
          gboard[i][j].minesAround++;
        
        if(i!=0&&gboard[i-1][j].havingBomb==true)        
          gboard[i][j].minesAround++;
        
        if(i!=0&&j!=columns-1&&gboard[i-1][j+1].havingBomb==true)
          gboard[i][j].minesAround++;

        if(j!=0&&gboard[i][j-1].havingBomb==true)
          gboard[i][j].minesAround++;
        
        if(j!=columns-1&&gboard[i][j+1].havingBomb==true)
          gboard[i][j].minesAround++;

        if(i!=rows-1&&j!=0&&gboard[i+1][j-1].havingBomb==true)
          gboard[i][j].minesAround++;
        
        if(i!=rows-1&&gboard[i+1][j].havingBomb==true)
          gboard[i][j].minesAround++;

        if(i!=rows-1&&j!=columns-1&&gboard[i+1][j+1].havingBomb==true)
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
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('MineSweeper'),
      ),
      body: Container(
        color: Colors.grey[50],
        child: Center(child: Wrap(children:[buildBoard()],),)
      )
    );
  }
}