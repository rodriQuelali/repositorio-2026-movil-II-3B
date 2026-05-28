
//los estados de mi diseño.

import 'package:flutter/material.dart';

class HomePageCalculator extends StatefulWidget {
  const HomePageCalculator({super.key});

  @override
  State<HomePageCalculator> createState() => _HomePageCalculatorState();
}

class _HomePageCalculatorState extends State<HomePageCalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cacluadora"),
        backgroundColor: const Color.fromARGB(255, 47, 38, 151),
      ),
      body: Column(
        children: [
          Text("Resultado"),
          TextField(
            
          )
        ],
      ),
    );
  }
}