// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const TextFields(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey)),
            fillColor: Color.fromRGBO(160, 155, 155, 0.301),
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.blueGrey)),
      ),
    );
  }
}
