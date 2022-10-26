import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

var fontRoboto = GoogleFonts.roboto;

customToast(String msg) => Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.SNACKBAR,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.white,
    textColor: Colors.black,
    fontSize: 16.0);

var borderForContainer = BoxDecoration(
  color: kPrimaryColor,
  border: Border.all(
    color: kBorderColor,
    width: 2,
  ),
  borderRadius: BorderRadius.circular(9),
);
var borderForContainer1Pixel = BoxDecoration(
  color: kPrimaryColor,
  border: Border.all(
    color: kBorderColor,
    width: 1,
  ),
  borderRadius: BorderRadius.circular(9),
);
var customDivider = Container(
  height: 1,
  color: kBorderColor,
);
var containerShadow = BoxShadow(
  color: const Color(0xff111111).withOpacity(0.1),
  offset: const Offset(0, 20),
  blurRadius: 24,
);
var congratsBg = const BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/images/congrats.png'),
    alignment: Alignment.topCenter,
  ),
);
var paddingHorizontal30 = const EdgeInsets.symmetric(horizontal: 30);
var paddingAll30 = const EdgeInsets.all(30);
var tabBarHeaderDeco = BoxDecoration(
  color: kWhiteColor,
  borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(9),
    topRight: Radius.circular(9),
  ),
  border: Border.all(
    color: kBorderColor,
    width: 1.0,
  ),
);
var decorationForChefProfile = BoxDecoration(
  color: kWhiteColor,
  borderRadius: BorderRadius.circular(6),
  boxShadow: [
    BoxShadow(
      color: const Color(0xff111111).withOpacity(0.1),
      offset: const Offset(0, 8),
      blurRadius: 16,
    ),
  ],
);

class AppStyling {
  static final styling = ThemeData(
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: kScaffoldBgColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: kScaffoldBgColor,
      elevation: 0,
      toolbarHeight: 80,
    ),
    cardTheme: const CardTheme(
      color: kWhiteColor,
      elevation: 0,
      margin: EdgeInsets.zero,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: kPrimaryColor.withOpacity(0.3),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: kPrimaryColor,
      hintStyle: InputStyling.hintStyle,
      enabledBorder: InputStyling.inputEnableBorder,
      focusedBorder: InputStyling.inputFocusBorder,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: kSecondaryColor,
    ),
  );
}

class InputStyling {
  static const textStyle = TextStyle(
    color: kInputTextColor,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
  );
  static const hintStyle = TextStyle(
    color: kHintTextColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
  );
  static var inputEnableBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(9),
    borderSide: const BorderSide(
      color: kBorderColor,
      width: 2.0,
    ),
  );
  static var inputFocusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(9),
    borderSide: const BorderSide(
      color: kBorderColor,
      width: 2.0,
    ),
  );
  static var noInputBorder = InputBorder.none;
  static const padding = EdgeInsets.symmetric(horizontal: 15, vertical: 18);
}

class RadiusHandler {
  static var containerRadius9 = BorderRadius.circular(9);
  static var containerRadius15 = BorderRadius.circular(15);
  static var radius100 = BorderRadius.circular(100);
  static var roundedRadius9 = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(9),
  );
}
