// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login/widgets/menu_lateral.dart';
import 'dart:convert';
import 'components/textfield.dart';
import 'map_page.dart';
import './services/storage_item.dart';

//soap request to get flight information
//create function called soapRequest
Future soapRequest() async {
  //create envelope
  String envelope =
      '''<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/">
   <soapenv:Header/>
   <soapenv:Body>
      <tem:GetFlightsRequest></tem:GetFlightsRequest>
   </soapenv:Body>
</soapenv:Envelope>''';

  //create headers
  Map<String, String> headers = {
    "Content-type": "text/xml; charset=utf-8",
    "SOAPAction": "http://localhost:8000/wsdl",
    "Host": "localhost:8000"
  };

  //make the request
  http.Response response = await http.post(
      Uri.parse("http://localhost:8000/wsdl"),
      headers: headers,
      body: envelope);
  print(response.body);
  print("hello, soap petition working");
  return response.body;
}

//user info page
class UserInfo extends StatelessWidget {
  //controladores de edición de texto
  final userIDController = TextEditingController();
  final passwordController = TextEditingController();

  final loginUrl = "http://localhost:1000/apiUser";

  //call function soapRequest and save the result in var result
  var result = soapRequest();
  //controladores boton de inicio de sesion
  getData() async {
    String? name = await SecureStorage().readSecureData("name");
    String? age = await SecureStorage().readSecureData("age");
    String? license = await SecureStorage().readSecureData("license");
    String? plate = await SecureStorage().readSecureData("plate");
    Map map = {
      "name": name,
      "age": age,
      "license": license,
      "plate": plate,
    };
    return map;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MenuLateral(),
        appBar: AppBar(
          title: const Text("Información de usuario"),
          backgroundColor: const LinearGradient(
            colors: [Color(0xFF7CC6CD), Color(0XFF001F29)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).colors[0],
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 15,
                      width: 2000,
                    ),
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: CircleAvatar(
                        child: ClipOval(
                          child: Image.network(
                            'https://cdn-icons-png.flaticon.com/512/1995/1995504.png',
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Avión tripulado:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      snap.data["plate"] ?? "Default",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Nombre:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      snap.data["name"] ?? "Default",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Licencia:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      snap.data["license"] ?? "Default",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Edad:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      snap.data["age"] ?? "Defaultd",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 15),
                  ]);
            }
          },
        ));
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
