//staless, llamar amatyerial app

import 'package:flutter/material.dart';
import 'package:flutter_application_calculator/ui/homePageCalculator.dart';

class HomeCalculator extends StatelessWidget {
  const HomeCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageCalculator(),
    );
  }


}