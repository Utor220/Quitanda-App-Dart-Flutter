import 'package:flutter/material.dart';

Map<int, Color> _swatchOpacity = {
  50: const Color.fromRGBO(79, 79, 79, .1),
  100: const Color.fromRGBO(79, 79, 79, .2),
  200: const Color.fromRGBO(79, 79, 79, .3),
  300: const Color.fromRGBO(79, 79, 79, .4),
  400: const Color.fromRGBO(79, 79, 79, .5),
  500: const Color.fromRGBO(79, 79, 79, .6),
  600: const Color.fromRGBO(79, 79, 79, .7),
  700: const Color.fromRGBO(79, 79, 79, .8),
  800: const Color.fromRGBO(79, 79, 79, .9),
  900: const Color.fromRGBO(79, 79, 79, 1),
};

abstract class CustomColors {
  static Color customContrastColor = Colors.yellow.shade700;
  static MaterialColor customSwatchColor =
      MaterialColor(0xFF4F4F4F, _swatchOpacity);
}
