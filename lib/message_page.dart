  import 'package:flutter/material.dart';

  
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
        title: 'Material App',
        home: Scaffold(
          backgroundColor: const Color(0xff1B202D),
          body: Padding(
        padding: EdgeInsets.only(left: 14.0,right: 14),
        child: SafeArea(
          child: Container(
            height: 1000,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Mensajes', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white
                      ),),
                      IconButton(onPressed: (){}, icon:  const Icon(Icons.search,
                        color: Colors.white,
                         size: 35,
                      ))
                    ],
                  ),
                          const SizedBox(height: 5,),
                  const Text('R E C I E N T E S', style: TextStyle(
                    color: Colors.white
                  ),),
                  const SizedBox(height: 15,),
                SizedBox(height: 30,),
                const Center(
                  child: Text('1 FEB 12:00',style: TextStyle(
                    color: Colors.white70
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
                      color: Colors.white70
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
                  padding: const EdgeInsets.only(bottom: 0.0),
                  child: Container(
                    height: 115,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      //color: Color.fromARGB(255, 83, 81, 118)  
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 0.0),
                              child: Container(
                                height:55,
                                width: 382,
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
    
      @override
      State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
      }
  }