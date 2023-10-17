import 'package:flutter/material.dart';
import 'package:login/login_page.dart';
import 'package:login/map_page.dart';
import 'package:login/user_info.dart';


//create blank page with scaffold called MapPage, the page should not have a back button
class MenuLateral extends StatelessWidget {
 
  MenuLateral({super.key});
  @override
  Widget build(BuildContext context) {
    return  Drawer(
        child: ListView(
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
              title: Text('Notificaciones'),
              onTap:  () => Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage())),
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
      );
  }
}
