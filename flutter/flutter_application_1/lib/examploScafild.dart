
import 'package:flutter/material.dart';


class MyAppHomeExamplo extends StatelessWidget {
  const MyAppHomeExamplo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("MI APLICACION"),
        ),
        body: Row(
          children: [
            Text("HOLA MUNDO"),
            Text("HOLA MUNDO")
          ],
        ),
        //barra de navegaion inferior
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon:Icon(Icons.ac_unit_sharp),
                label: "INICIO"
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.settings),
                label: "CONFIGURACION"
            ),
          ]
        ),

        //boton flotante
        floatingActionButton: FloatingActionButton(
          onPressed: ()=>{},
          child: Icon(Icons.access_time_filled),
        ),
        
        //draw- menu lateral.
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: Text("Perfil"),
                onTap: ()=>{},
              ),
              ListTile(
                title: Text("Configuracion"),
                onTap: ()=>{},
              )
            ],
          ),
        ),
      ),
    );
  }
}