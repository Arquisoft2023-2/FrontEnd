import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'dart:async';
import './services/storage_item.dart';

//create blank page with scaffold called MapPage, the page should not have a back button
class MapPage extends StatelessWidget {
  void showAlert(BuildContext context) {
    QuickAlert.show(context: context, type: QuickAlertType.warning);
  }

  final notificationUrl = "http://localhost:1000/apiNotification";

  void recurrentQuery() async {
    Timer.periodic(Duration(minutes: 1), (timer) async {
      String? token = await SecureStorage().readSecureData("token");
      //por ahora solo se envia el token
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
