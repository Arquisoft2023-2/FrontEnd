import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'dart:async';
import './services/storage_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//create blank page with scaffold called MapPage, the page should not have a back button
class MapPage extends StatelessWidget {
  void showAlert(BuildContext context) {
    QuickAlert.show(context: context, type: QuickAlertType.warning);
  }

  final notificationUrl = "http://localhost:1000/apiNotification";

  void recurrentQuery(BuildContext context) async {
    Timer.periodic(Duration(minutes: 1), (timer) async {
      String? token = await SecureStorage().readSecureData("token");
      String? plate = await SecureStorage().readSecureData("Plate");
      String graphQLQuery = ' { getNotifications(id: "$plate"){ message } }';

      try {
        var response = await http.post(Uri.parse(notificationUrl),
            headers: {"Content-type": "application/json", "token": token!},
            body: json.encode({'query': graphQLQuery}));
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          print(data);
          if (data["data"]["getNotifications"].length > 0) {
            showAlert(context);
          }
        }
      } catch (e) {
        print(e);
      }
    });
  }

  MapPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //call recurrentQuery

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Mapa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Mapa"),
            ElevatedButton(
              onPressed: () {
                recurrentQuery();
              },
              child: Text("Alerta"),
            ),
          ],
        ),
      ),
    );
  }
}
