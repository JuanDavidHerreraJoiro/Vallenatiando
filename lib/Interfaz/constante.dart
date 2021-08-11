import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFACACAC);

const kDefaultPaddin = 20.0;

class DeliveryColorsRedOrange {
  static final dark = Color(0xFF03091E);
  static final grey = Color(0xFF212738);
  static final lightGrey = Color(0xFFBBBBBB);
  static final veryLightGrey = Color(0xFFF3F3F3);
  static final white = Colors.white;
  static final red1 = Color(0xFFff1100);
  static final red2 = Color(0xFFb33930);
  static final red3 = Color(0xFFf77268);
  static final red4 = Color(0xFFBe2525);
  static final red5 = Color(0xFFc53b3b);
  static final orange6 = Color(0xFFFFA500);
  static final orange7 = Color(0xFFFF8C00);
  static final orange8 = Color(0xFFffb366);
  static final orange9 = Color(0xFFffa64d);
  static final orange10 = Color(0xFFff8000);
}

final _border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5),
  borderSide: BorderSide(
      color: DeliveryColorsRedOrange.red1, width: 2, style: BorderStyle.solid),
);

final lightTheme = ThemeData(
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: Colors.black,
    displayColor: Colors.black,
  ),
  inputDecorationTheme: InputDecorationTheme(
      border: _border,
      enabledBorder: _border,
      focusedBorder: _border,
      hintStyle: GoogleFonts.poppins(color: Colors.black, fontSize: 10)),
  iconTheme: IconThemeData(
    color: Colors.black,
  ),
  accentIconTheme: IconThemeData(
    color: Colors.black,
  ),
  primaryIconTheme: IconThemeData(
    color: Colors.black,
  ),
);

final deliveryGradients = [
  DeliveryColorsRedOrange.red3,
  DeliveryColorsRedOrange.orange8,
];
