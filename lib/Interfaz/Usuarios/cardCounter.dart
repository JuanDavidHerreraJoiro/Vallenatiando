import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turismo/Interfaz/Usuarios/roundIconBtn.dart';

class CardCounter extends StatefulWidget {
  CardCounter({Key? key}) : super(key: key);

  @override
  _CardCounterState createState() => _CardCounterState();
}

int conteo = 1;

class _CardCounterState extends State<CardCounter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF6F6F6),
        borderRadius: const BorderRadius.all(Radius.circular(40)),
      ),
      child: Row(
        children: [
          RoundIconBtn(
            iconData: Icons.remove,
            color: Colors.black38,
            press: sustraer,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20 / 4),
            child: Text(
              "$conteo",
              style: GoogleFonts.montserrat(
                  fontSize: 14, fontWeight: FontWeight.w800),
            ),
          ),
          RoundIconBtn(
            iconData: Icons.add,
            press: agregar,
          ),
        ],
      ),
    );
  }

  void agregar() {
    setState(() => conteo++);
  }

  void sustraer() {
    if (conteo == 0) {
      return;
    }
    setState(() => conteo--);
  }
}
