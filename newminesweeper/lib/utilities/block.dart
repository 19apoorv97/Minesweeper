import 'package:flutter/material.dart';
import 'board.dart';
import 'functionality.dart';

class Block extends StatefulWidget {
  bool havingMine=false;
  bool revealed=false;
  bool flagged=false;
  int minesAround=0;
  int xCor;
  int yCor;
  Function funCallBack;
 @override
  _BlockState createState() => _BlockState();
}

class _BlockState extends State<Block> {

  @override
  void initState() {
    // TODO: implement initState
    widget.funCallBack=blockSetState;
    super.initState();
  }

  void blockSetState(){
    setState(() {
    });
  }
  

  Widget blockState()
  {
    int img=widget.minesAround;
    if(widget.revealed==false&&widget.flagged==false)
      return Image.asset('images/tile.png',height:50,width:50);
    if(widget.revealed==false&&widget.flagged==true)
      return Image.asset('images/flagged.png',height:50,width:50);
    if(widget.revealed==true&&widget.havingMine==true){
      return Image.asset('images/bomb.png',height:50,width:50);
    }
    else
      return Image.asset('images/$img.png',height:50,width:50); 
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: blockState(),
      onTap: (){
        if(widget.flagged==false)
        {
        if(widget.minesAround==0&&widget.revealed==false&&widget.havingMine==false)
        {
          Auto.x=widget.xCor;
          Auto.y=widget.yCor;
          Auto.clean();
        }
        setState(() {
          widget.revealed=true;
        });
        }
      },
      onLongPress: (){
        if(widget.revealed==false)
        {
        setState(() {
          //widget.flagged=!widget.flagged;
        if(Auto.blocksFlagged<Auto.actualMines&&widget.flagged==false)
        {
          widget.flagged=true;
          Auto.blocksFlagged++;
        }
        else if(widget.flagged==true)
        {
          widget.flagged=false;
          Auto.blocksFlagged--;
        }       
        });
        Board.boardCallBack();
        }
      },
    );
  }
}

