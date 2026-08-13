
import 'package:flutter/material.dart';
import 'package:flutter_application_navigation/UI/DetailPage.dart';
import 'package:flutter_application_navigation/UI/HomePage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Navogations',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/details': (context) => const DetailPage(),
        /**agregar dos rutas mas con layouts su tara : Registro page y estadoPage*/
      },
      
    );
  }
}