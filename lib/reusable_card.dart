import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/tic_card.dart';
import 'logic.dart';
import 'input_screen.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class ReusableCard extends StatelessWidget {
  String val='';
  Color colour,backcolour;
  ReusableCard(this.val)
  {
    if(val=='X')
      colour=backcolour=HexColor("fcdab7");
    else if(val=='O')
      colour=backcolour=HexColor("b6c9f0");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(val,
          style: TextStyle(
            color: colour,
            fontWeight: FontWeight.w700,
            fontSize: 55.0,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: HexColor("#1c313a"),
        borderRadius: BorderRadius.circular(12.0),
      ),
      height: 100.0,
      width: 100.0,
    );
  }
}
