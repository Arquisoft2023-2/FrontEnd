// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'components/textfield.dart';
import 'dart:io';
import 'map_page.dart';
import './services/storage_item.dart';
import './services/recurrentQuery.dart';
import 'package:quickalert/quickalert.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //controladores de edición de texto
  final userIDController = TextEditingController();
  final passwordController = TextEditingController();
  final String loginUrl = kIsWeb ? "http://localhost:1000/apiAuth" : "http://10.0.2.2:444/apiAuth";
  final String userUrl = kIsWeb ? "http://localhost:1000/apiUser" : "http://10.0.2.2:444/apiUser";
  //final loginUrl = "http://10.0.2.2:444/apiAuth";
  //final userUrl = "http://10.0.2.2:444/apiUser";
  //controladores boton de inicio de sesion
  void saveUserInformation(String token, String id) async {
    int idint = int.parse(id);
    String graphQLQuery =
        'query{ getUser(id: $idint){ name age license fk_plate }}';
    try {
      var url = Uri.parse(userUrl);
      var response = await http.post(url,
          headers: {"Content-type": "application/json", "tokenapi": token},
          body: json.encode({'query': graphQLQuery}));
      print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        SecureStorage()
            .writeSecureData("name", data["data"]["getUser"]["name"]);
        SecureStorage()
            .writeSecureData("age", data["data"]["getUser"]["age"].toString());
        SecureStorage()
            .writeSecureData("license", data["data"]["getUser"]["license"]);
        SecureStorage()
            .writeSecureData("plate", data["data"]["getUser"]["fk_plate"]);
      }
    } catch (e) {
      print(e);
    }
  }

  void sigIn(String id, String password, context) async {
    String graphQLQuery = 'query{ login(id: $id, password: "$password") }';
    //Navigator.pushReplacement(
            //send storage to map page
            //context,
            //MaterialPageRoute(builder: (context) => MapPage()));
          //print("Response status: ${response.statusCode}");
    try {
      var url = Uri.parse(loginUrl);
      var response = await http.post(url,
          headers: {"Content-type": "application/json"},
          body: json.encode({'query': graphQLQuery}));
      if (response.body == '{"data":{"login":"false"}}' ||
          response.body == '{"data":{"login":null}}') {
          //show quickalert thats indicates bad login
          QuickAlert.show(
            context: context,
            title: "Contraseña o ID incorrecto",
            type: QuickAlertType.error
            
          );
      } else {
        recurrentQuery();
        Navigator.pushReplacement(
            //send storage to map page
            context,
            MaterialPageRoute(builder: (context) => MapPage()));
        print("Response status: ${response.statusCode}");

        //parse response body
        var data = jsonDecode(response.body);
        String token = data["data"]["login"];
        print("Response token: ${token}");
        SecureStorage().writeSecureData("token", token);
        SecureStorage().writeSecureData("id", id);
        saveUserInformation(token, id);
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
    sigIn(userIDController.text, passwordController.text, context);
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Adjust padding
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  ),
  child: Text(
    "Iniciar Sesión",
    style: TextStyle(
      color: Colors.white,
      fontSize: 16, // Adjust font size
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
