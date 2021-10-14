import 'package:flutter/cupertino.dart';

class CustomColors {
  static const Color error = Color(0xFFDB4459);
  static const Color success = Color(0xFF96C113);
  static const Color warning = Color(0xFFFBB613);

  final Color primary;
  final Color secondary;
  final Color panelLight;
  final Color background;
  final Color panelDark;
  final Color panelMedium;
  final List<Color> bgGradient;
  final Color black;
  final Color white;
  final Color gray;

  CustomColors({
    required this.primary,
    required this.secondary,
    required this.panelLight,
    required this.background,
    required this.panelDark,
    required this.panelMedium,
    required this.bgGradient,
    required this.black,
    required this.white,
    required this.gray,
  });
}
