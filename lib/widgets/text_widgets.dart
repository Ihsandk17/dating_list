import 'package:flutter/material.dart';

Widget smallText({text, size, color}) => Text(text,
    style: TextStyle(
        fontSize: size ?? 14, color: color, fontWeight: FontWeight.bold));

Widget headingTeax({text, size, color}) {
  return Text(
    text,
    style: TextStyle(
        color: color, fontSize: size ?? 18, fontWeight: FontWeight.bold),
  );
}
