import 'package:flutter/material.dart';

class SmaillText extends StatelessWidget {
  const SmaillText(
      {super.key,
      required this.text,
      this.color = const Color(0xFF332d2b),
      this.size = 12,
      this.height = 1.2});
  final String text;
  final Color? color;
  final double size;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: "Poppins",
          height: height,
          color: color,
          fontSize: size,
          fontWeight: FontWeight.w400),
    );
  }
}
