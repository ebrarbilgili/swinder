import 'package:flutter/material.dart';

class ThemeConstant {
  static ThemeConstant? _instance;
  static ThemeConstant get instance {
    _instance ??= ThemeConstant._init();
    return _instance!;
  }

  ThemeConstant._init();

  ThemeData get themeData => ThemeData(
        colorScheme: colorScheme,
        scaffoldBackgroundColor: colorScheme.background,
        appBarTheme: appBarTheme,
        indicatorColor: colorScheme.primary,
        elevatedButtonTheme: elevatedButtonThemeData,
        textButtonTheme: textButtonThemeData,
      );

  TextButtonThemeData get textButtonThemeData {
    return TextButtonThemeData(
      style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(colorScheme.onBackground)),
    );
  }

  ElevatedButtonThemeData get elevatedButtonThemeData {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(StadiumBorder()),
        // overlayColor: MaterialStateProperty.all(colorScheme.onSurface),
      ),
    );
  }

  AppBarTheme get appBarTheme {
    return AppBarTheme(
      backgroundColor: colorScheme.background,
      iconTheme: IconThemeData(color: colorScheme.primary),
      elevation: 0,
    );
  }

  ColorScheme get colorScheme => ColorScheme(
        primary: Colors.black,
        primaryVariant: Colors.black87,
        secondary: Colors.grey,
        secondaryVariant: Colors.grey,
        surface: Colors.white,
        background: Colors.white, //xxxx
        error: Colors.red,
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        onSurface: Colors.black,
        onBackground: Colors.transparent,
        onError: Colors.red,
        brightness: Brightness.light,
      );
}
