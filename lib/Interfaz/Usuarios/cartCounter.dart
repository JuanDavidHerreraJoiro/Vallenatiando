import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turismo/Interfaz/Usuarios/roundIconBtn.dart';

class CartCounter extends StatelessWidget {
  const CartCounter({
    Key? key,
  }) : super(key: key);

  final int contador = 2;

  @override
  Widget build(BuildContext context) {
    //

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
            press: agregar,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20 / 4),
            child: Text(
              "$contador",
              style: GoogleFonts.montserrat(
                  fontSize: 14, fontWeight: FontWeight.w800),
            ),
          ),
          RoundIconBtn(
            iconData: Icons.add,
            press: () {},
          ),
        ],
      ),
    );
  }

  agregar() {}
}
