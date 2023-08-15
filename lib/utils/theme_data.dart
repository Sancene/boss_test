import 'package:flutter/material.dart';

extension ThemeDataX on ThemeData {
  TextStyle get h16 => textTheme.displayLarge!.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        fontFamily: 'Arial',
        height: 1,
      );
}
