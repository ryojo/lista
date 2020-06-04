import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  List _itens = [];
  
  void _carregarItens(){
      _itens = [];
    for(int i = 0; i<=10; i++){
        Map<String,dynamic> item = Map();
        item['titulo'] = "Titulo ${i} Lorem ipsum dolor sit amet.";
        item['descrição'] = "Descrição ${i} ipsum dolor sit amet.";
        _itens.add(item);
    }
  }

  @override

  Widget build(BuildContext context) {

  _carregarItens();
    return Scaffold(
appBar: AppBar( 
  title: Text("Lista"),
 backgroundColor: Colors.blue,

),
body: Container(
  padding: EdgeInsets.all(20),
  child:ListView.builder(
    itemCount:_itens.length,
    itemBuilder: (context,indice){
       //Map<String,dynamic> item = _itens[indice];
      //print(" ${item["titulo"]}");
      
           return ListTile(
              
                  title: Text(_itens[indice]["titulo"]),
                  subtitle:Text( _itens[indice]["descrição"]),
                onTap: (){
                    //  print("função rápida");
                  showDialog(
                    context:context,
                    builder: (context){
                        return AlertDialog(
                           title: Text(_itens[indice]["titulo"]),
                           titleTextStyle: TextStyle(
                             fontSize: 20,
                             color: Colors.black
                           ),
                           titlePadding: EdgeInsets.all(20), //espaço dentro do alertdialog
                           content: Text(_itens[indice]["descrição"]), 
                      // backgroundColor: Colors.grey,
                      actions: <Widget>[
                        FlatButton(onPressed: (){
                          Navigator.pop(context);
                        },
                         child: Text("Ok",
                         style: TextStyle(
                         
                          ),
                         ),
                         
                         )
                      ],
                        );
                    } 
                  );
                  },
                  onLongPress: (){
                      print("função longa");
                  },
           );
    },

  ),
  ),

    );
  }
}