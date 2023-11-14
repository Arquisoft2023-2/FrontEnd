import 'package:flutter/material.dart';
import 'package:login/login_page.dart';
import 'package:login/user_info.dart';
import 'package:login/login_page.dart';
import 'package:login/widgets/menu_lateral.dart';
import 'package:quickalert/quickalert.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../map_page.dart' as mapPage;
import './services/storage_item.dart';

class MapPage extends StatelessWidget {
  get context => null;

  void showAlert(BuildContext context) {
    QuickAlert.show(context: context, type: QuickAlertType.warning);
  }

  void logOut(context) async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  final notificationUrl = "http://localhost:1000/apiNotification";

  void recurrentQuery(BuildContext context) async {
    print('hola');
    Timer.periodic(Duration(minutes: 1), (timer) async {
      String? plate = await SecureStorage().readSecureData("plate");
      String graphQLQuery = ' { getNotifications(id: "$plate"){ message } }';
      print(graphQLQuery);
      try {
        var response = await http.post(Uri.parse(notificationUrl),
            headers: {"Content-type": "application/json"},
            body: json.encode({'query': graphQLQuery}));
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          var notifications = data["data"]["getNotifications"];
          //iterate over the notifications and send quickalert for each notification
          for (var notification in notifications) {
            QuickAlert.show(
              context: context,
              title: notification["message"],
              type: QuickAlertType.warning,
            );
          }
        }
      } catch (e) {
        print(e);
      }
    });
  }

  MapPage({super.key});
  
  Widget build(BuildContext context) {
    recurrentQuery(context);
    return Scaffold(
      drawer: MenuLateral(),
      appBar: AppBar(
        title: const Text("Mapa"),
        backgroundColor: const LinearGradient(
          colors: [Color(0xFF7CC6CD), Color(0XFF001F29)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ).colors[0],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Mapa"),
            
          ],
        ),
      ),
    );
  }
}
