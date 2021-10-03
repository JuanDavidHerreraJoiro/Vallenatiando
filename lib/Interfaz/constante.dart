import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

/*
C:\Program Files\Java\jdk1.8.0_291\bin>
keytool -list -v -keystore C:\Users\Juand\.android\debug.keystore -alias androiddebugkey -storepass android -keypass android
*/
/*
keytool -exportcert -alias androiddebugkey -keystore "C:\Users\Juand\.android\debug.keystore" | "C:\Users\Juand\OneDrive\Escritorio\Juan David Herrera\openssl\bin\openssl" sha1 -binary | "C:\Users\Juand\OneDrive\Escritorio\Juan David Herrera\openssl\bin\openssl" base64
*/
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
  static final red6 = Color(0xFFFC8D8D);
  static final red7 = Color(0xFF870802);
  static final red8 = Color(0xFFFF6F4C);
  static final red9 = Color(0xFFFC9491);
  static final orange6 = Color(0xFFFFA500);
  static final orange7 = Color(0xFFFF8C00);
  static final orange8 = Color(0xFFffb366);
  static final orange9 = Color(0xFFffa64d);
  static final orange10 = Color(0xFFff8000);
  static final orange11 = Color(0xFFFDAE9E);
}

class DeliveryColorsFinal {
  static final redfinal1 = Color(0xFFd51a21);
  static final redfinal2 = Color(0xFFed1b26);
  static final redfinal3 = Color(0xFF901619);
  static final redfinal4 = Color(0xFFae171e);
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
    hintStyle: GoogleFonts.poppins(color: Colors.black, fontSize: 10),
  ),
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

final deliveryGradients2 = [
  DeliveryColorsRedOrange.orange11,
  DeliveryColorsRedOrange.red6,
];
final deliveryGradientsFinal = [
  DeliveryColorsFinal.redfinal2,
  DeliveryColorsFinal.redfinal3,
];

class FontTexto {
  static final styleTitulo2 = GoogleFonts.montserrat(
    color: Colors.black54,
    //color: DeliveryColorsRedOrange.red1,
    fontSize: 18.sp,
  );
  static final styleTexto = GoogleFonts.montserrat(
    color: Colors.black,
    //color: DeliveryColorsRedOrange.red1,
    fontSize: 10.sp,
  );
  static final styleTexto3 = GoogleFonts.montserrat(
    color: Colors.black54,
    //color: DeliveryColorsRedOrange.red1,
    fontSize: 9.sp,
  );
  static final styleSearch = GoogleFonts.montserrat(
    color: Colors.black54,
    //color: DeliveryColorsRedOrange.red1,
    fontSize: 10.sp,
  );
  static final styleTitulo = GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 35,
  );
  static final styleAppbar = GoogleFonts.montserrat(
    color: Colors.white,
    fontSize: 18,
  );
  static final styleCajaTexto = GoogleFonts.montserrat(
    color: Colors.black,
  );
  static final styleNombreProducto = GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 18,
  );
  static final styleSubtexto = GoogleFonts.montserrat(
    color: Colors.black26,
    fontSize: 15,
  );
  static final styleDescrip = GoogleFonts.montserrat(
    color: Colors.black45,
    fontSize: 15,
  );
}
