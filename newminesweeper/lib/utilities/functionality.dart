import 'block.dart';
class Auto
{
  static List<List<Block>> gboard;
  static int x;
  static int y;
  static int rows;
  static int columns;
  static int actualMines;
  static int blocksFlagged;
  //static Function blockCallBack;
  static void fun(int i,int j)
  {
    if(i<0||i>rows-1||j<0||j>columns-1)
      return;
    if(gboard[i][j].minesAround==0&&gboard[i][j].revealed==false&&gboard[i][j].flagged==false)
    {
      gboard[i][j].revealed=true;
      gboard[i][j].funCallBack();
      fun(i-1,j-1);
      fun(i-1,j);
      fun(i-1,j+1);
      fun(i,j-1);
      fun(i,j+1);
      fun(i+1,j-1);
      fun(i+1,j);
      fun(i+1,j+1);
      if(i!=0&&j!=0&&gboard[i-1][j-1].minesAround!=0&&gboard[i-1][j-1].flagged==false){
        gboard[i-1][j-1].revealed=true;
        gboard[i-1][j-1].funCallBack();
      }
      if(i!=0&&gboard[i-1][j].minesAround!=0&&gboard[i-1][j].flagged==false){
        gboard[i-1][j].revealed=true;
        gboard[i-1][j].funCallBack();
      }
      if(i!=0&&j!=columns-1&&gboard[i-1][j+1].minesAround!=0&&gboard[i-1][j+1].flagged==false){
        gboard[i-1][j+1].revealed=true;
        gboard[i-1][j+1].funCallBack();
      }
      if(j!=0&&gboard[i][j-1].minesAround!=0&&gboard[i][j-1].flagged==false){
        gboard[i][j-1].revealed=true;
        gboard[i][j-1].funCallBack();
      }
      if(j!=columns-1&&gboard[i][j+1].minesAround!=0&&gboard[i][j+1].flagged==false){
        gboard[i][j+1].revealed=true;
        gboard[i][j+1].funCallBack();
      }
      if(i!=rows-1&&j!=0&&gboard[i+1][j-1].minesAround!=0&&gboard[i+1][j-1].flagged==false){
        gboard[i+1][j-1].revealed=true;
        gboard[i+1][j-1].funCallBack();
      }
      if(i!=rows-1&&gboard[i+1][j].minesAround!=0&&gboard[i+1][j].flagged==false){
        gboard[i+1][j].revealed=true;
        gboard[i+1][j].funCallBack();
      }
      if(i!=rows-1&&j!=columns-1&&gboard[i+1][j+1].minesAround!=0&&gboard[i+1][j+1].flagged==false){
        gboard[i+1][j+1].revealed=true;
        gboard[i+1][j+1].funCallBack();
      }
        
    }
  }
  static void clean()
  {
    fun(x,y); 
  }
}