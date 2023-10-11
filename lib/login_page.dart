// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:login/components/buttons.dart';
import 'components/textfield.dart';
import 'map_page.dart';
import 'package:quickalert/quickalert.dart';
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //controladores de edición de texto
  final userIDController = TextEditingController();
  final passwordController = TextEditingController();
  

//create checkCredentials function that returns boolean
  bool checkCredentials() {
    //solo para fines de prueba
    if (userIDController.text == "admin" && passwordController.text == "admin") {
      return true;
    } else {
      return false;
    }
  }
  //controladores boton de inicio de sesion
  void sigIn(BuildContext context) {
    //if checkCredentials is true, then navigate to map page
    if (checkCredentials()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MapPage()),
      );
    } else {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: "Credenciales incorrectas",
      );
    }
  }



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
              // add another function to the button

              //create elevated button to sign in
              ElevatedButton(
                onPressed: () {
                  sigIn(context);
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  padding: EdgeInsets.symmetric(horizontal: 200, vertical: 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                child: Text(
                  "Iniciar Sesión",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),


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
