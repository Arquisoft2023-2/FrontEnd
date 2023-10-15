// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'components/textfield.dart';
import 'map_page.dart';
import './services/storage_item.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //controladores de edición de texto
  final userIDController = TextEditingController();
  final passwordController = TextEditingController();

  final loginUrl = "http://localhost:1000/apiAuth";

  //controladores boton de inicio de sesion

  void sigIn(String id, String password, context) async {
    String graphQLQuery = 'query{ login(id: $id, password: "$password") }';
    try {
      var url = Uri.parse(loginUrl);
      var response = await http.post(url,
          headers: {"Content-type": "application/json"},
          body: json.encode({'query': graphQLQuery}));

      if (response.statusCode == 200 &&
          (response.body != '{"data":{"login":"false"}}')) {
        Navigator.pushReplacement(
            //send storage to map page

            context, MaterialPageRoute(builder: (context) => MapPage()));
        print("Response status: ${response.statusCode}");
        //parse response body
        var data = jsonDecode(response.body);
        SecureStorage().writeSecureData("token", data["data"]["login"]);
        SecureStorage().writeSecureData("id", id);
      }
    } catch (e) {
      print(e);
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
                expresion: r"^[1-9]\d{0,9}$",
              ),
              const SizedBox(
                height: 25,
              ),
              // Espacio de texto contraseña
              TextFields(
                controller: passwordController,
                hintText: "Contraseña",
                obscureText: true,
                expresion: r"^.*$",
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
                  sigIn(
                      userIDController.text, passwordController.text, context);
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
