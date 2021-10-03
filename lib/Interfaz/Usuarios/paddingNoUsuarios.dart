import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:turismo/Interfaz/Inicio/InicioEmpresas.dart';
import 'package:turismo/Interfaz/Usuarios/Inicio.dart';

class PaddingNoUsuarios extends StatefulWidget {
  final Color1;
  final Color2;
  const PaddingNoUsuarios({
    Key? key,
    required this.Color1,
    required this.Color2,
  }) : super(key: key);

  @override
  _PaddingNoUsuariosState createState() => _PaddingNoUsuariosState();
}

class _PaddingNoUsuariosState extends State<PaddingNoUsuarios> {
  @override
  Widget build(BuildContext context) {
    const logoSize = 80.0;
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        color: Colors.grey[50],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  IconButton(
                    iconSize: 20.sp,
                    icon: Icon(Icons.home_outlined),
                    color: widget.Color1, //Colors.redAccent,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => Inicio(),
                        ),
                      );
                    },
                  ),
                  Text(
                    "Inicio",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      color: widget.Color1, //Colors.redAccent,
                      fontSize: 10.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ), //
            ),
            Expanded(
              child: Column(
                children: [
                  IconButton(
                    iconSize: 20.sp,
                    icon: Icon(Icons.business_outlined),
                    color: widget.Color2, //Colors.black54,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => InicioEmpresas(),
                        ),
                      );
                    },
                  ),
                  Text(
                    "Empresas",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      color: widget.Color2, //Colors.black45,
                      fontSize: 10.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ), //
            ),
          ],
        ),
      ),
    );
  }
}
