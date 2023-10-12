import 'package:flutter/material.dart';
import 'package:login/map_page.dart';
import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "login": (context) => LoginPage(),
        "mapa": (context) => MapPage(),
      },
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
