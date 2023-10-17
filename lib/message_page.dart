  import 'dart:convert';
  import 'package:flutter/material.dart';
  import 'package:login/models/Message.dart';
  import 'package:login/widgets/menu_lateral.dart';
  import 'package:http/http.dart' as http;
  import 'package:login/services/storage_item.dart';
  
  class homepage extends StatefulWidget {
    const homepage({Key? key}) : super(key: key);
    
    @override
    _HomePageSate createState() => _HomePageSate();
    
  }

  class _HomePageSate extends State<homepage> {
    final _textController = TextEditingController();
    String userMessage = '';
    final msgUrl = "http://localhost:1000/apiMsg";
    late Future<List<Message>> _listadoMensajes;

    Future<List<Message>> _getMensajes() async{
      List<Message> listaMsgs = [];
      String graphQLQuery =
        'query{ getMsgs{ id text date}}';
      try{
        var url = Uri.parse(msgUrl);
        var response = await http.post(url,
            headers: {"Content-type": "application/json"},
            body: json.encode({'query': graphQLQuery}));
        final data = jsonDecode(response.body);
        print(data["data"]["getMsgs"]);
        for(var item in data["data"]["getMsgs"]){
          listaMsgs.add(
            Message(item["id"], item["text"], item["date"])
          );
        }
        return listaMsgs;
      } catch (e){
        throw Exception("Fallo la conexion");
      } 
    }

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listadoMensajes = _getMensajes();
  }

    @override
    
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: Scaffold(
          drawer: MenuLateral(),
        appBar: AppBar(
        title: const Text("Mensajes Torre de Control"),
        backgroundColor: const LinearGradient(
          colors: [Color(0xFF7CC6CD), Color(0XFF001F29)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ).colors[0],
      ),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          body: FutureBuilder(
            future: _listadoMensajes,
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView(
                  children: listMsgs(snapshot.data!),
                );
                
              }else if(snapshot.hasError){
                return Text("Error");
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      );
    }
    
    List<Widget> listMsgs(List<Message> data){
      List<Widget> msgs = [];
      for (var msg in data) {
        msgs.add(
          Card(child: Container(
                    decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff7A8194)
                    ),
                    child:  Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(msg.text,style: TextStyle(
                            color: Colors.white,
                          ),),
                        ),Center(
                  child: Text(msg.date,style: TextStyle(
                    color: Color.fromARGB(255, 39, 39, 52)
                  ),),
                ),
                      ],
                    ),
                  ),
          )
        );
      }
      return msgs;
    }
    
  }

