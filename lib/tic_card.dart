import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/game_screen.dart';
import 'package:tic_tac_toe/reusable_card.dart';
import 'logic.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class TicCard extends StatefulWidget {
  int win_1,win_2,draw_s;
  Function(int,int,int) Callback;
  TicCard(this.win_1,this.win_2,this.draw_s,this.Callback);

  @override
  _TicCardState createState() => _TicCardState();
}

String val1='',val2='',val3='',val4='',val5='',val6='',val7='',val8='',val9='';
Logic l3=new Logic(player1,player2);
class _TicCardState extends State<TicCard> {
  void winassist(int a)
  {
    if(a==1)
      {
          widget.win_1++;
          widget.Callback(widget.win_1,widget.win_2,widget.draw_s);
          showToast(
              "$player1 won!",
            duration: Duration(seconds: 3),
            textStyle: TextStyle(
              fontSize: 32.0,
              color: HexColor("b6c9f0"),
            ),
              backgroundColor: HexColor("#000a12"),
              context: context,
          );
          l3.reset_board();
          Timer(Duration(seconds: 2), (){
            setState(() {
              clearall(a);
            });
          });
      }
    else if(a==2)
      {
        widget.win_2++;
        widget.Callback(widget.win_1,widget.win_2,widget.draw_s);
        showToast(
          "$player2 won!",
          duration: Duration(seconds: 3),
          textStyle: TextStyle(
            fontSize: 32.0,
            color: HexColor("fcdab7"),
          ),
          backgroundColor: HexColor("#000a12"),
          context: context,
        );
        l3.reset_board();
        Timer(Duration(seconds: 2), (){
          setState(() {
            clearall(a);
          });
        });
      }
    else if(a==0)
      {
        widget.draw_s++;
        widget.Callback(widget.win_1,widget.win_2,widget.draw_s);
        showToast(
          "Match Drawn!",
          duration: Duration(seconds: 3),
          textStyle: TextStyle(
            fontSize: 32.0,
            color: Colors.white,
          ),
          backgroundColor: HexColor("#000a12"),
          context: context,
        );
        l3.reset_board();
        Timer(Duration(seconds: 2), (){
          setState(() {
            clearall(a);
          });
        });
      }
    else
      {
        return;
      }
  }
  void clearall(int a)
  {
    if(a==1 || a==2 || a==0)
      {
        val1='';
        val2='';
        val3='';
        val4='';
        val5='';
        val6='';
        val7='';
        val8='';
        val9='';
        currmove='O';
      }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  if(val1=='')
                    {
                      l3.input(0, 0,currmove);
                      val1=currmove;
                      currmove=l3.change_turn(currmove);
                      winassist(l3.check_winner(0,0));
                    }
                });
              },
              child: ReusableCard(val1),
            ),
            SizedBox(width: 10.0,),
            GestureDetector(
              onTap: (){
                setState(()
                {
                  if(val2=='')
                    {
                      l3.input(0, 1,currmove);
                      val2=currmove;
                      currmove=l3.change_turn(currmove);
                      winassist(l3.check_winner(0,1));
                    }
                });
              },
              child: ReusableCard(val2),
            ),
            SizedBox(width: 10.0,),
            GestureDetector(
              onTap: (){
                setState(() {
                  if(val3=='')
                    {
                      l3.input(0, 2,currmove);
                      val3=currmove;
                      currmove=l3.change_turn(currmove);
                      winassist(l3.check_winner(0,2));
                    }
                });
              },
              child: ReusableCard(val3),
            ),
          ],
        ),
        SizedBox(height: 10.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  if(val4=='')
                    {
                      l3.input(1, 0,currmove);
                      val4=currmove;
                      currmove=l3.change_turn(currmove);
                      winassist(l3.check_winner(1,0));
                    }
                });
              },
              child: ReusableCard(val4),
            ),
            SizedBox(width: 10.0,),
            GestureDetector(
              onTap: (){
                setState(() {
                  if(val5=='')
                    {
                      l3.input(1, 1,currmove);
                      val5=currmove;
                      currmove=l3.change_turn(currmove);
                      winassist(l3.check_winner(1,1));
                    }
                });
              },
              child: ReusableCard(val5),
            ),
            SizedBox(width: 10.0,),
            GestureDetector(
              onTap: (){
                setState(() {
                  if(val6=='')
                    {
                      l3.input(1, 2,currmove);
                      val6=currmove;
                      currmove=l3.change_turn(currmove);
                      winassist(l3.check_winner(1,2));
                    }
                });
              },
              child: ReusableCard(val6),
            ),
          ],
        ),
        SizedBox(height: 10.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  if(val7=='')
                    {
                      l3.input(2, 0,currmove);
                      val7=currmove;
                      currmove=l3.change_turn(currmove);
                      winassist(l3.check_winner(2,0));
                    }
                });
              },
              child: ReusableCard(val7),
            ),
            SizedBox(width: 10.0,),
            GestureDetector(
              onTap: (){
                setState(() {
                  if(val8=='')
                  {
                    l3.input(2, 1,currmove);
                    val8=currmove;
                    currmove=l3.change_turn(currmove);
                    winassist(l3.check_winner(2,1));
                  }
                });
              },
              child: ReusableCard(val8),
            ),
            SizedBox(width: 10.0,),
            GestureDetector(
              onTap: (){
                setState(() {
                  if(val9=='')
                    {
                      l3.input(2, 2,currmove);
                      val9=currmove;
                      currmove=l3.change_turn(currmove);
                      winassist(l3.check_winner(2,2));
                    }
                });
              },
              child: ReusableCard(val9),
            ),
          ],
        ),
      ],
    );
  }
}