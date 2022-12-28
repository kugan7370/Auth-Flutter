import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  const BigText(
      {super.key,
      required this.text,
      this.color = const Color(0xFF332d2b),
      this.size = 22,
      this.overflow = TextOverflow.ellipsis});
  final String text;
  final Color? color;
  final double size;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: "Poppins",
          color: color,
          overflow: overflow,
          fontSize: size,
          fontWeight: FontWeight.w500),
    );
  }
}
