import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/tic_card.dart';
import 'logic.dart';
import 'input_screen.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

String currmove='O';
class GameScreen extends StatefulWidget {
  String player1_name,player2_name;
  GameScreen(this.player1_name,this.player2_name);

  @override
  _GameScreenState createState() => _GameScreenState();
}
String player1='Player1',player2='Player2';
int win1=0,win2=0;
int draws=0;
class _GameScreenState extends State<GameScreen> {
  int w1=0,w2=0,d=0;
  callback(int win1,int win2,int draws) {
    setState(() {w1=win1;
    w2=win2;
    d=draws;});
  }

  void initState()
  {
    super.initState();
    Logic l1=new Logic(widget.player1_name,widget.player2_name);
    player1=l1.returnname1();
    player2=l1.returnname2();
    win1=l1.returnwin1();
    win2=l1.returnwin2();
  }
  Logic l2=new Logic(player1,player2);
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("192734"),
          title: Center(
            child: Text('TICTACTOE',
              style: TextStyle(
                fontFamily: 'Girassol-Regular',
                color: HexColor("ffffff"),
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
        backgroundColor: HexColor("#000a12"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20.0,),
          Expanded(
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$player1: $w1",
                    style: TextStyle(
                      fontFamily: 'Pattaya-Regular',
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                      color: HexColor("b6c9f0"),
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(width: 30.0,),
                  Text(
                    "$player2: $w2",
                    style: TextStyle(
                      fontFamily: 'Pattaya-Regular',
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                      color: HexColor("fcdab7"),
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            "Draws: $d",
            style: TextStyle(
              fontFamily: 'Pattaya-Regular',
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              color: Colors.white70,
              letterSpacing: 1.5,
            ),
          ),
          SizedBox(
            width: 320.0,
            child: Divider(
              color: Colors.white70,
              thickness: 6.0,
            ),
            height: 60.0,
          ),

          TicCard(
              win1,
              win2,
              draws,
              (int ww1,int ww2,int d1){
                setState(() {
                  w1+=ww1;
                  w2+=ww2;
                  d+=d1;
                });
              },
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50.0,
                  width: 100.0,
                  child: ElevatedButton(
                      onPressed:(){
                        Navigator.pop(context);
                  },
                  child: Text("EXIT",
                  style: TextStyle(
                    fontFamily: 'Girassol-Regular',
                    color: HexColor("ffffff"),
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.5,
                  ),
                  ),
                    style: ElevatedButton.styleFrom(primary: HexColor("#1c313a"),),
                  ),
                ),
                SizedBox(width: 30.0,),
                Container(
                  height: 50.0,
                  width: 120.0,
                  child: ElevatedButton(
                    onPressed:(){
                      setState(() {
                        l2.reset_board();
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
                        l2.reset_wins();
                        l2.curr_reset();
                        w1=l2.returnwin2();
                        w2=l2.returnwin1();
                        d=0;
                      });
                  },
                    child: Text("RESET",
                      style: TextStyle(
                        fontFamily: 'Girassol-Regular',
                        color: HexColor("ffffff"),
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(primary: HexColor("#1c313a"),),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
