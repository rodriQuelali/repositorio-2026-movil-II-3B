
import 'package:flutter/material.dart';


class HomePageStafull extends StatefulWidget {
  const HomePageStafull({super.key});

  @override
  State<HomePageStafull> createState() => _HomePageStafullState();
}

class _HomePageStafullState extends State<HomePageStafull> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 216, 183, 85),
        title: Text("Contador"),
      ),
      body: Text("Hola Mundo ...."),

      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
        ),
    );
  }
}


