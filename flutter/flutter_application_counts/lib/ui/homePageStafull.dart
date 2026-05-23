
import 'package:flutter/material.dart';


class HomePageStafull extends StatefulWidget {
  const HomePageStafull({super.key});

  @override
  State<HomePageStafull> createState() => _HomePageStafullState();
}

class _HomePageStafullState extends State<HomePageStafull> {

  //tarea
  //realizar el decremento, con otro floatingActionButton

  int _con = 0;

  //setState -- va ser que realize la actualizacion o el estado.

  //prodcedimiento
  void _incremento(){
    setState(() {
       //con = con +1;
       _con++;
    });
   
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 96, 96, 95),
        title: Text("Contador"),
      ),

      body: Center(
        child: Container(
        width: 300,
        height: 200,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 14, 13, 13),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(2, 4),
            ),
          ],
        ),
          child: Column(
            children: [
              Text("Contador de Numeros", style: TextStyle(color: Colors.white, fontSize: 25.5),),
              // el estado en comillas simples: ''
              Text('$_con', style: TextStyle(color: Colors.white, fontSize: 20),),
            ],
          )
        )
      ),



      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: (){_incremento();},
            
            backgroundColor: const Color.fromARGB(255, 46, 48, 49),
            child: Icon(
              Icons.add,
              color: Colors.white,),
          ),
          floatingActionButton: FloatingActionButton(
          onPressed: (){_decremento();},
          
          backgroundColor: const Color.fromARGB(255, 46, 48, 49),
          child: Icon(
            Icons.remove,
            color: Colors.white,),
          ),
        ],
      ) 
    );
  }
}


