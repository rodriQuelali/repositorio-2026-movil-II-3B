import 'package:flutter/material.dart';
import 'package:flutter_application_1/examploDraw.dart';
import 'package:flutter_application_1/examploScafild.dart';


void main() {
  runApp(MyAppDraw());
}



class MyApp extends StatelessWidget {
  
  //build -- es una funcion que si o si necesita para 
  //construir mi aplicacion
  
  @override
  Widget build(BuildContext context) {
    //materialApp es como la hoja. 
    return  MaterialApp(
      title: 'MI aplicacion Movil',
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

//StatelessWidget
//snipet, para crear de forma rapida: sta
class MyAppHome extends StatelessWidget {
  const MyAppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



//StatefulWidget
class name extends StatefulWidget {
  const name({super.key});

  @override
  State<name> createState() => _nameState();
}

class _nameState extends State<name> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



