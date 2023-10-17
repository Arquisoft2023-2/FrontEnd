  import 'package:flutter/material.dart';
import 'package:login/models/Message.dart';
  import 'package:login/widgets/menu_lateral.dart';
  
  class homepage extends StatefulWidget {
    const homepage({Key? key}) : super(key: key);
    
    @override
    _HomePageSate createState() => _HomePageSate();
    
  }

  class _HomePageSate extends State<homepage> {
    final _textController = TextEditingController();
    String userMessage = '';

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
          body: Padding(
        padding: EdgeInsets.only(left: 14.0,right: 14),
        child: SafeArea(
          child: Container(
            height: 1000,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                    children: [
                      Center(
                        child: const Text('Mensajes', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Color.fromARGB(255, 39, 39, 52)
                        ),),
                      ),
                      IconButton(onPressed: (){}, icon:  const Icon(Icons.search,
                        color: Color.fromARGB(255, 39, 39, 52),
                         size: 35,
                      ))
                    ],
                  ),
                  const SizedBox(height: 5,),
                  const Text('R E C I E N T E S', style: TextStyle(
                    color: Color.fromARGB(255, 39, 39, 52)
                  ),),
                  const SizedBox(height: 15,),
                SizedBox(height: 30,),
                const Center(
                  child: Text('1 FEB 12:00',style: TextStyle(
                    color: Color.fromARGB(255, 39, 39, 52)
                  ),),
                ),
                SizedBox(height: 8,),
                Container(
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff373E4E)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('I commented on Figma, I want to add\n sjdiw weosjwy cys sow woois ijwdwd wysxta\njsd',style: TextStyle(
                      color: Colors.white,
                    ),),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 135.0),
                  child: Container(
                    decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff7A8194)
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('I commented on Figma, I want to add\n sjdiw weosjwy',style: TextStyle(
                        color: Colors.white,
                      ),),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff373E4E)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Next Month',style: TextStyle(
                      color: Colors.white,
                    ),),
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(height: 10,),
                const Center(
                  child: Text('08:12',style: TextStyle(
                      color: Color.fromARGB(255, 39, 39, 52)
                  ),),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 135.0),
                  child: Container(
                    decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff7A8194)
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('I commented on Figma, I want to add\n sjdiw weosjwy',style: TextStyle(
                        color: Colors.white,
                      ),),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 350.0),
                  child: Container(
                    width: 50,
                    decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff7A8194)
                    ),
                    child:  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('?', style: TextStyle(
                        color: Colors.white,
                      ),),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    
                    height: 115,
                    //width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      //color: Color.fromARGB(255, 83, 81, 118)  
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                                  child: Container(
                                    height:55,
                                    width: 700,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 83, 81, 118),
                                      borderRadius: BorderRadius.circular(50)
                                    ),
                                    //child: Icon(Icons.camera_alt_outlined),
                                    child: 
                                        TextField(
                                          controller: _textController,
                                          textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                              hintText: 'Escribe tu mensaje aqui',
                                              border: OutlineInputBorder(),
                                              hintStyle: TextStyle(color: Color.fromARGB(255, 231, 205, 202)),
                                              suffixIcon: IconButton(
                                                onPressed: (){
                                                  _textController.clear();
                                                }, icon: Icon(Icons.clear),
                                              )
                                            ),
                                          ),      
                                    ),
                                ),  
                                //SizedBox(width: 15,),
                                //const Text('Message',style: TextStyle(
                                //  color: Colors.white54
                                //),),
                                //Spacer(),
                                //const Padding(
                                //  padding: EdgeInsets.only(right: 8.0),
                                //  child: Icon(Icons.send,color:  Colors.white54,),
                                //),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: MaterialButton(
                                height:45,
                                onPressed: () {
                                  setState(() {
                                    userMessage = _textController.text;
                                  });
                                },
                                color: const Color.fromARGB(255, 42, 65, 77),
                                  child: Text('Enviar', style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
        ),
      );
    }
    
    
  }

