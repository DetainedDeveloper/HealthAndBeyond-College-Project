import 'dart:math' show Random;
import 'package:flutter/material.dart' show Color, Colors;

class RandomColorGenerator {
  static Color get randomColor => Colors.primaries[Random().nextInt(Colors.primaries.length)];

  static Color get generateRandomColor => Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
}
