import 'block.dart';
class Auto
{
  static List<List<Block>> boardRef;
  static int x;
  static int y;
  static int rows;
  static int columns;
  //static Function blockCallBack;
  static void fun(int i,int j)
  {
    if(i<0||i>rows-1||j<0||j>columns-1)
      return;
    if(boardRef[i][j].minesAround==0&&boardRef[i][j].revealed==false)
    {
      boardRef[i][j].revealed=true;
      boardRef[i][j].funCallBack();
      fun(i-1,j-1);
      fun(i-1,j);
      fun(i-1,j+1);
      fun(i,j-1);
      fun(i,j+1);
      fun(i+1,j-1);
      fun(i+1,j);
      fun(i+1,j+1);
      if(i!=0&&j!=0&&boardRef[i-1][j-1].minesAround!=0){
        boardRef[i-1][j-1].revealed=true;
        boardRef[i-1][j-1].funCallBack();
      }
      if(i!=0&&boardRef[i-1][j].minesAround!=0){
        boardRef[i-1][j].revealed=true;
        boardRef[i-1][j].funCallBack();
      }
      if(i!=0&&j!=columns-1&&boardRef[i-1][j+1].minesAround!=0){
        boardRef[i-1][j+1].revealed=true;
        boardRef[i-1][j+1].funCallBack();
      }
      if(j!=0&&boardRef[i][j-1].minesAround!=0){
        boardRef[i][j-1].revealed=true;
        boardRef[i][j-1].funCallBack();
      }
      if(j!=columns-1&&boardRef[i][j+1].minesAround!=0){
        boardRef[i][j+1].revealed=true;
        boardRef[i][j+1].funCallBack();
      }
      if(i!=rows-1&&j!=0&&boardRef[i+1][j-1].minesAround!=0){
        boardRef[i+1][j-1].revealed=true;
        boardRef[i+1][j-1].funCallBack();
      }
      if(i!=rows-1&&boardRef[i+1][j].minesAround!=0){
        boardRef[i+1][j].revealed=true;
        boardRef[i+1][j].funCallBack();
      }
      if(i!=rows-1&&j!=columns-1&&boardRef[i+1][j+1].minesAround!=0){
        boardRef[i+1][j+1].revealed=true;
        boardRef[i+1][j+1].funCallBack();
      }
        
    }
  }
  static void clean()
  {
    fun(x,y);
    
  }
}