import 'package:flutter/widgets.dart';

class Colorful {
  static Color color1 = Color.fromARGB(255, 82, 99, 255);
  static Color color2 = Color.fromARGB(255, 255, 255, 255);
  static Color color3 = Color.fromARGB(255, 76, 76, 76);
}

class Texts {
  static TextStyle style1 = TextStyle(
      color: Colorful.color2, fontSize: 28, fontWeight: FontWeight.bold);
  static TextStyle style2 = TextStyle(
      color: Colorful.color2, fontSize: 100, fontWeight: FontWeight.w500);
  static TextStyle style4 = TextStyle(
      color: Colorful.color2, fontSize: 22, fontWeight: FontWeight.w500);
  static TextStyle style3 = TextStyle(
      color: Colorful.color2, fontSize: 20, fontWeight: FontWeight.w500);
}
