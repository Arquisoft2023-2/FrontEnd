import 'package:flutter/material.dart';
import 'package:login/login_page.dart';
import 'package:login/user_info.dart';
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('SePuedeQuitar'),
              accountEmail: Text('SePuedeQuitar@quitar.com'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    'https://cdn-icons-png.flaticon.com/512/1995/1995504.png',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://cdn.pixabay.com/photo/2012/06/28/08/26/plane-50893_960_720.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Perfil'),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => UserInfo())),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Mensajes'),
              onTap: () => null,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configuración'),
              onTap: () => null,
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Salir'),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage())),
            )
          ],
        ),
      ),
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
            ElevatedButton(
              onPressed: () {
                showAlert(context);
              },
              child: const Text("Alerta"),
            ),
          ],
        ),
      ),
    );
  }
}
