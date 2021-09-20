import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldFormDescription extends StatelessWidget {
  final IconData icono;
  final String labelText;
  final TextEditingController controlador;
  const TextFieldFormDescription({
    Key? key,
    required this.icono,
    required this.labelText,
    required this.controlador,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: TextFormField(
        maxLines: 4,
        controller: controlador,
        style: GoogleFonts.montserrat(
          color: Colors.black,
        ), // // Probar todos los teclados
        decoration: new InputDecoration(
          icon: Icon(
            icono,
            color: Colors.red,
            size: 40,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          labelText: labelText,
          labelStyle: GoogleFonts.montserrat(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
