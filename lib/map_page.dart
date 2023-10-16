import 'package:flutter/material.dart';
import 'package:login/login_page.dart';
import 'package:login/user_info.dart';
import 'package:quickalert/quickalert.dart';

//create blank page with scaffold called MapPage, the page should not have a back button
class MapPage extends StatelessWidget {
  void showAlert(BuildContext context) {
    QuickAlert.show(context: context, type: QuickAlertType.warning);
  }

  MapPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('SePuedeQuitar'),
              accountEmail: Text('SePuedeQuitar@quitar.com'),  
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network('https://cdn-icons-png.flaticon.com/512/1995/1995504.png',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: NetworkImage('https://cdn.pixabay.com/photo/2012/06/28/08/26/plane-50893_960_720.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Perfil'),
              onTap:  () => Navigator.push(context, MaterialPageRoute(builder: (context) => UserInfo())),
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
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Mapa"),
        backgroundColor: const LinearGradient(
          colors: [Color(0xFF7CC6CD),Color(0XFF001F29)],
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
