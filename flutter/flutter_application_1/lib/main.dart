import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Text("Hola mundosssss") 
      );
  }


  //funciones
  int suma(){
    return 0;
  }


  //Procedimientos 
  void sumaa(){
    print("suma de 0");
  }

  //funcion widget

  Widget cajaTexto(){
    return TextField();
  }


}



