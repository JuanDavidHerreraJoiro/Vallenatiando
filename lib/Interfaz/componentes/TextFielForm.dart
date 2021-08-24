import 'package:flutter/material.dart';

class TextFieldForm extends StatelessWidget {
  final IconData icono;
  final String labelText;
  final TextEditingController controlador;
  const TextFieldForm({
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
        controller: controlador,
        style: TextStyle(
          color: Colors.black,
        ), // // Probar todos los teclados
        decoration: new InputDecoration(
            icon: Icon(
              icono,
              color: Colors.red,
              size: 40,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.red, width: 0.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.black, width: 0.5),
            ),
            labelText: labelText,
            labelStyle: TextStyle(
              color: Colors.black,
            )),
      ),
    );
  }
}