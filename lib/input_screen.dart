import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/game_screen.dart';
import 'package:tic_tac_toe/logic.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';


class InputPage extends StatefulWidget {
  const InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final player1=new TextEditingController();
  final player2=new TextEditingController();
  String player1name,player2name;
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
      backgroundColor: HexColor("15202b"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 1,
              child: SizedBox(height: 15.0,)),
          Expanded(
            flex: 2,
            child: Text("Pass 'n' Play",
              style: TextStyle(
                fontFamily: 'Girassol-Regular',
                fontWeight: FontWeight.w700,
                fontSize: 50.0,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(flex:1,child: SizedBox(height: 15.0,)),
          Expanded(
            flex: 8,
            child: Image(
              image: AssetImage('images/strategy-512.png'),
              height: 215.0,
              width: 215.0,
            ),
          ),
          SizedBox(height: 15.0,),
          Expanded(
            flex:2,
            child: Text("Welcome ,",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Girassol-Regular',
                fontWeight: FontWeight.w600,
                fontSize: 32.0,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 10.0,),
          Expanded(
            flex: 2,
            child: TextField(
              controller: player1,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey,
                prefixIcon: Icon(Icons.verified_user),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                hintText: 'Player 1',
              ),
            ),
          ),
          SizedBox(height: 7.0,),
          Expanded(
            flex: 2,
            child: TextFormField(
              controller: player2,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.verified_user),
                filled: true,
                fillColor: Colors.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                hintText: 'Player 2',
              ),
            ),
          ),
            Expanded(
              flex: 2,
          child: Container(
          child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.lightBlue,),
          child: Text(
            "LET`S PLAY",
            style: TextStyle(
              fontFamily: 'Girassol-Regular',
              fontWeight: FontWeight.w600,
              fontSize: 28.0,
              color: HexColor("#000000"),
              letterSpacing: 1.0,
            ),
          ),
          onPressed: (){
            setState(() {
              player1name=player1.text;
              player2name=player2.text;
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return GameScreen(player1name,player2name);
              }));
            });
          },
          ),
          margin: EdgeInsets.only(top:10.0),
          width: double.infinity,
          height: 55.0,
          ),
            ),
        ],
      ),
    );
  }
}


