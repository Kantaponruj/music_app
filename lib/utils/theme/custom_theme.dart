import 'package:flutter/material.dart';
import 'package:music_app/utils/theme/custom_text_theme.dart';

const Color primaryColor = Color(0xfffb7806);

const Color secondaryColor = Color(0xffa5abaf);

const Color backgroundColor = Color(0xff232122);

const Color secondaryBackgrondColor = Color.fromARGB(255, 52, 52, 54);

const Color textColor = Colors.white;

const Color iconColor = Colors.white;

ThemeData customTheme() {
  return ThemeData(
    useMaterial3: false,
    // fontFamily: 'IBM',
    // primarySwatch: Colors.blue,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: _buildAppBarTheme(),
  );
}

AppBarTheme _buildAppBarTheme() {
  return AppBarTheme(
    backgroundColor: backgroundColor,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: headingText().copyWith(color: primaryColor),
  );
}
