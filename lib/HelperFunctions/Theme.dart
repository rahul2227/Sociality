import 'package:flutter/material.dart';

class Constants {
  String appName = "Flutter App";

  static Color kTextcolor = Color(0xFF141414);
  static Color kBackgroundcolor = Color(0xFFFEECD6);
  static Color kCardcolor = Color(0xFFFDDBC5);
  static Color kbodycolor = Color(0xFFADACAC);
  static Color kNotactive = Color(0xFFD8D8D8);
  static Color kaccent1 = Color(0xFFF06449);
  static Color kaccent2 = Color(0xFFFFED66);
}

InputDecoration textFieldInputDecorationCircular() {
  return InputDecoration(
    filled: true,
    fillColor: Constants.kCardcolor,
    //hoverColor: Constants.kCardcolor,
    focusColor: Constants.kaccent1,
    border: new OutlineInputBorder(
        borderRadius: const BorderRadius.all(const Radius.circular(30.0))),
    focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(const Radius.circular(30.0)),
        borderSide: new BorderSide(color: Constants.kaccent1, width: 3.0)),
    errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(const Radius.circular(30.0)),
        borderSide: new BorderSide(color: Constants.kaccent1, width: 3.0)),
    contentPadding: EdgeInsets.all(12.0),
  );
}

InputDecoration textFieldInputDecorationSquared(String hintText) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
    filled: true,
    fillColor: Constants.kCardcolor,
    border: InputBorder.none,
    focusedBorder: OutlineInputBorder(
        borderSide: new BorderSide(color: Constants.kaccent1, width: 2.0)),
    hintText: hintText,
    hintStyle: TextStyle(
        color: Constants.kTextcolor,
        fontWeight: FontWeight.w500,
        fontSize: 18.0),
  );
}

InputDecoration textFieldInputDecorationSmall() {
  return InputDecoration(
    filled: true,
    fillColor: Constants.kCardcolor,
    //hoverColor: Constants.kCardcolor,
    focusColor: Constants.kaccent1,
    border: OutlineInputBorder(
        borderSide: new BorderSide(color: Constants.kaccent1, width: 3.0)),
    focusedBorder: OutlineInputBorder(
        borderSide: new BorderSide(color: Constants.kaccent1, width: 3.0)),
    errorBorder: OutlineInputBorder(
        borderSide: new BorderSide(color: Constants.kaccent1, width: 3.0)),
    contentPadding: EdgeInsets.all(12.0),
  );
}

ButtonStyle eventButtonStyle(Color buttonColor) {
  return ButtonStyle(
    padding: MaterialStateProperty.all(EdgeInsets.all(8.0)),
    backgroundColor: MaterialStateProperty.all(buttonColor),
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
    overlayColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) return buttonColor;
        if (states.contains(MaterialState.focused) ||
            states.contains(MaterialState.pressed)) return buttonColor;
        return null; // Defer to the widget's default.
      },
    ),
  );
}

ButtonStyle eventButtonStyle15(Color buttonColor) {
  return ButtonStyle(
    padding: MaterialStateProperty.all(EdgeInsets.all(15.0)),
    backgroundColor: MaterialStateProperty.all(Constants.kCardcolor),
    overlayColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) return buttonColor;
        if (states.contains(MaterialState.focused) ||
            states.contains(MaterialState.pressed)) return buttonColor;
        return null; // Defer to the widget's default.
      },
    ),
  );
}

ButtonStyle eventButtonStyleSized(
    {Color buttonColor, double verticle, double horizontal}) {
  return ButtonStyle(
      padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: verticle, horizontal: horizontal)),
      backgroundColor: MaterialStateProperty.all(buttonColor),
      overlayColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) return buttonColor;
          if (states.contains(MaterialState.focused) ||
              states.contains(MaterialState.pressed)) return buttonColor;
          return null; // Defer to the widget's default.
        },
      ));
}
