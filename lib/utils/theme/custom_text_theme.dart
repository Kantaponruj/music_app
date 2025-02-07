import 'package:flutter/material.dart';

TextStyle headingText() {
  return const TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
}

TextStyle subHeadingText() {
  return const TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
  );
}

TextStyle bodyText({bool isBold = false}) {
  return TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
    overflow: TextOverflow.ellipsis,
  );
}

TextStyle captionText() {
  return const TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
  );
}
