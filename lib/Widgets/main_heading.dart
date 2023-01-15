// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class MainHeading extends StatelessWidget {
  const MainHeading({super.key, required this.text});
  final text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
