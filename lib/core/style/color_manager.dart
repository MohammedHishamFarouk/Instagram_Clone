import 'package:flutter/material.dart';

class ColorManager {
  static const Color darkGrey = Color(0xff212121);
  static const Color grey = Colors.grey;
  static const Color lightGrey = Color(0x1A808080);

  static const LinearGradient signatureColor = LinearGradient(
    colors: [
      Color(0xFFFBAA47),
      Color(0xFFD91A46),
      Color(0xFFA60F93),
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );
  static const LinearGradient liveColor = LinearGradient(
    colors: [
      Color(0xFFE20337),
      Color(0xFFC60188),
      Color(0xFF7700C3),
    ],
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
  );

  static const LinearGradient blueGradient = LinearGradient(
    colors: [
      Color(0xFF6FC7FC),
      Color(0xFF378DEF),
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );
}
