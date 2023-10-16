import 'package:flutter/material.dart';
import 'package:login/map_page.dart';
import 'package:login/user_info.dart';
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
        "info": (context) => UserInfo(),
      },
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
