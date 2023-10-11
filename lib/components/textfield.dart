// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final String expresion;

  const TextFields(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.expresion});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: TextFormField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey)),
                  fillColor: Color.fromRGBO(160, 155, 155, 0.301),
                  filled: true,
                  hintText: hintText,
                  hintStyle: TextStyle(color: Colors.blueGrey)),
              validator: (value) {
                String pattern = expresion;
                RegExp regExp = new RegExp(pattern);
                return regExp.hasMatch(value ?? "") ? null : "ID no valido";
              }),
        ),
      ),
    );
  }
}
