import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/input_screen.dart';


class Logic
{
  var _board = List.generate(3,
        (_) => List.generate(3, (_) => ''),
  );
  String _currturn;
  String player1,player2;
  int w1=0,w2=0;
  Logic(this.player1,this.player2) //constructor
  {
    _currturn='O';
    w1=0;
    w2=0;
    for(var i=0;i<3;i++)
    {
      for(var j=0;j<_board[i].length;j++)
      {
        _board[i][j]=''; //empty board
      }
    }
  }
  void curr_reset()
  {
    _currturn='O';
  }
  void reset_board()
  {
    for(var i=0;i<3;i++)
    {
      for(var j=0;j<_board[i].length;j++)
      {
        _board[i][j]=''; //empty board
      }
    }
  }
  String returnname1()
  {
    return player1;
  }
  String returnname2()
  {
    return player2;
  }
  int check_winner(int x,int y)
  {
    String curr=_board[x][y];
    int row,col,ldiag,rdiag,count;
    row=col=ldiag=rdiag=count=0;
    for(var i=0;i<3;i++)
    {
      for(var j=0;j<_board[i].length;j++)
      {
        if(_board[i][j]!='')
          {
            count++;
          }
      }
    }

        for(var i=0;i<3;i++)
        {
          if(_board[x][i]==curr)
            col++;
          if(_board[i][y]==curr)
            row++;
          if(_board[i][i]==curr)
            ldiag++;
          if(_board[i][2-i]==curr)
            rdiag++;
        }
        if(row==3 || col==3 || ldiag==3 || rdiag==3)
        {
          if(_board[x][y]=='O') {
            w1++;
            return 1;
          }
          else {
            w2++;
            return 2;
          }
        }
        else if(count==9)
        {
          reset_board();
          return 0;
        }
      }
  void displayboard()
  {
    for(var i=0;i<3;i++)
    {
      for(var j=0;j<_board[i].length;j++)
      {
        print(_board[i][j]);
      }
    }
  }
  void input(int x,int y,String val)
  {
    if(_board[x][y]=='')
    _board[x][y]=val;
  }
  String change_turn(String ss)
  {
    if(ss=='X')
    ss='O';
    else if(ss=='O')
      ss='X';

    return ss;
  }
  int returnusername()
  {
    if(_currturn=='O')
      return 1;
    else
      return 2;
  }
  void reset_wins()
  {
    w1=0;
    w2=0;
  }
  int returnwin1()
  {
    return w1;
  }
  int returnwin2()
  {
    return w2;
  }
}