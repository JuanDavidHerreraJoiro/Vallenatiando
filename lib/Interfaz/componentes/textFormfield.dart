import 'package:flutter/material.dart';
import 'package:turismo/Interfaz/constante.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration
      (
        gradient: LinearGradient(colors: deliveryGradients2),
        color:  Colors.white,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}