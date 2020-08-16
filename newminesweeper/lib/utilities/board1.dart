import 'dart:math';
import 'package:flutter/material.dart';
import 'block.dart';
import 'functionality.dart';

class Board extends StatelessWidget {
  int rows=10;
  int columns=8;
  static int mines=9;
  List<int> minesCordinate=List();
  List<List<Block>> gboard;

  Board()
  {
    gboard=List.generate(rows, (row) => List.generate(columns,(column) => Block()),growable: false);
    logic();
    Auto.gboard=gboard;
    Auto.rows=rows;
    Auto.columns=columns;
    Auto.actualMines=mines;
    Auto.blocksFlagged=0;
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
    return buildBoard();
  }
}