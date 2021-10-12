import 'package:flutter/material.dart';

const Color customBlue = Color(0xFF25386E);

Color dateColor({String? date}) {
  switch (date) {
    case "Yesterday":
      return Colors.pinkAccent;
    case "Today":
      return Colors.blueAccent;
    default:
      return customBlue;
  }
}
