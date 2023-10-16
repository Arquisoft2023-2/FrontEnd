// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login/widgets/menu_lateral.dart';
import 'dart:convert';
import 'components/textfield.dart';
import 'map_page.dart';
import './services/storage_item.dart';


class UserInfo extends StatelessWidget {
  UserInfo({super.key});

  //controladores de edición de texto
  final userIDController = TextEditingController();
  final passwordController = TextEditingController();

  final loginUrl = "http://localhost:1000/apiUser";

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
      print("error");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MenuLateral(),
        appBar: AppBar(),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(height: 15),
              Icon(
                Icons.account_circle_sharp,
                size: 70,
              ),
              SizedBox(height: 30),
              Text(
                "Nombre:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Text(
                "Jhon 10",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
               Text(
                "Licencia:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Text(
                "XS1234",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Text(
                "Edad:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Text(
                "56",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Text(
                "Correo:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Text(
                "56",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ]),
    );
  }
}
/*
child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(height: 15),
              Icon(
                Icons.account_circle_sharp,
                size: 70,
              ),
              SizedBox(height: 30),
              Text(
                "Nombre:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Text(
                "Jhon 10",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
               Text(
                "Licencia:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Text(
                "XS1234",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Text(
                "Edad:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Text(
                "56",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Text(
                "Correo:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Text(
                "56",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ]),
          ),
 */