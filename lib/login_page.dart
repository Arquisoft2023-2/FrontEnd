// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:login/components/buttons.dart';

import 'components/textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //controladores de edición de texto
  final userIDController = TextEditingController();
  final passwordController = TextEditingController();

  //controladores boton de inicio de sesion
  void sigIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(height: 15),
              Icon(
                Icons.account_circle_sharp,
                size: 70,
              ),
              SizedBox(height: 30),
              Text(
                "Inicio de Sesión",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 15,
              ),

              //Espacio texto UserName o UserID
              TextFields(
                controller: userIDController,
                hintText: "ID de usuario",
                obscureText: false,
              ),
              const SizedBox(
                height: 25,
              ),
              // Espacio de texto contraseña
              TextFields(
                controller: passwordController,
                hintText: "Contraseña",
                obscureText: true,
              ),

              const SizedBox(
                height: 8,
              ),
              //Olvido contraseña
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Text(
                      "Olvidé mi contraseña",
                      style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              Buttons(onTap: sigIn),

              const SizedBox(
                height: 40,
              ),

              Image(
                image: AssetImage('lib/images/despegue_avion.png'),
                height: 130,
              )
            ]),
          ),
        ));
  }
}
