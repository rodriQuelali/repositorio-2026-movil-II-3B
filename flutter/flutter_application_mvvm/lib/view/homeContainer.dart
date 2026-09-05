
import 'package:flutter/material.dart';
import 'package:flutter_application_mvvm/view/home_page_view.dart';
import 'package:flutter_application_mvvm/view/post_list_view.dart';
import 'package:flutter_application_mvvm/view/registro_page.dart';


class HomeContainer extends StatefulWidget {
  const HomeContainer({super.key});

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {

  int _indiceActual = 0;

  //lista de wigets, lista de layauots...
  List<Widget> _listaContenidos =[
    HomePage(), //0
    PostListView(), //1
    ListaPedidosPage() //2
    //maximo hasta 5 
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

      //pintar el llamado de mi layouts..
      body: IndexedStack(
        index: _indiceActual,
        children: _listaContenidos,
      ),

      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: 
            (){
              setState(() {
                _indiceActual = 0;
              });
            }, icon: Icon(Icons.add)),
            IconButton(onPressed: (){
              setState(() {
                _indiceActual = 1;
              });
            }, 
            icon: Icon(Icons.list)),
            IconButton(onPressed: (){
              setState(() {
                _indiceActual = 2;
              });
            }, 
            icon: Icon(Icons.list))
          ],
        ),
      )
      /*bottomNavigationBar: BottomNavigationBar(
        items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "INICIO",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.save),
              label: "LISTA JSON")
          ]
        ),*/
    );
  }
}