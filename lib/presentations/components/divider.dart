import 'package:flutter/material.dart';

Widget defaultdivider({double? height, Color? color, double? width, double? thickness}) {
  return SizedBox(
    width: width ?? 40,
    child: Divider(
      height: height ?? (6),
      thickness: thickness ?? (1),
      color: color ??const Color.fromARGB(58, 111, 109, 109),
    ),
  );
}
