import 'package:flutter/material.dart';

DateTime selectedDate = DateTime.now();

class TextFieldFormDate extends StatefulWidget {
  final IconData icono;
  final String labelText;
  final TextEditingController controlador;
  final IconData iconoSub;

  const TextFieldFormDate({
    Key? key,
    required this.icono,
    required this.labelText,
    required this.controlador,
    required this.iconoSub,
  }) : super(key: key);

  @override
  _TextFieldFormDateState createState() => _TextFieldFormDateState();
}

class _TextFieldFormDateState extends State<TextFieldFormDate> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: TextFormField(
        controller: widget.controlador,
        style: TextStyle(
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
          labelStyle: TextStyle(
            color: Colors.black,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              _selectDate(context);
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

  _selectDate(BuildContext context) async {
    DateTime fechaActual = new DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(1000),
      lastDate: DateTime(3030),
      helpText: "SELECCIONAR FECHA",
    );
    /*if (picked != null && picked != selectedDate) */
    setState(() {
      selectedDate = picked!;
      widget.controlador.text = "${selectedDate.toLocal()}".split(' ')[0];
    });
  }
}
