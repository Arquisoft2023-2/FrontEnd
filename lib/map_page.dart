import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';


void showAlert(BuildContext context) {
    QuickAlert.show(context: context, type: QuickAlertType.warning);  
  }
  //create blank page with scaffold called MapPage, the page should not have a back button
  class MapPage extends StatelessWidget {
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
