import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'dart:async';
//create blank page with scaffold called MapPage, the page should not have a back button
class MapPage extends StatelessWidget {
  void showAlert(BuildContext context) {
    QuickAlert.show(context: context, type: QuickAlertType.warning);
  }
  final notificationUrl = "http://localhost:1000/apiNotification";

  void recurrentQuery() {
    Timer.periodic(Duration(minutes: 1), (timer) {
      String graphQLQuery = 'query{ getNotifications }';
    });
  }

  MapPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                showAlert(context);
              },
              child: Text("Alerta"),
            ),
          ],
        ),
      ),
    );
  }
}
