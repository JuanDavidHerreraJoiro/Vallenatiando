import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turismo/Interfaz/Usuarios/googleMaps.dart';

class TextFieldFormUbicacion extends StatefulWidget {
  final IconData icono;
  final String labelText;
  final TextEditingController controlador;
  final IconData iconoSub;

  const TextFieldFormUbicacion({
    Key? key,
    required this.icono,
    required this.labelText,
    required this.controlador,
    required this.iconoSub,
  }) : super(key: key);

  @override
  _TextFieldFormUbicacionState createState() => _TextFieldFormUbicacionState();
}

class _TextFieldFormUbicacionState extends State<TextFieldFormUbicacion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: TextFormField(
        controller: widget.controlador,
        style: GoogleFonts.montserrat(
          color: Colors.black,
        ), // // Probar todos los teclados
        decoration: new InputDecoration(
          icon: Icon(
            widget.icono,
            color: Colors.red,
            size: 40,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
          labelText: widget.labelText,
          labelStyle: GoogleFonts.montserrat(
            color: Colors.black,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => GoogleMaps(),
                ),
              );
            },
            icon: Icon(
              widget.iconoSub,
              size: 35,
            ),
          ),
        ),
      ),
    );
  }
}
