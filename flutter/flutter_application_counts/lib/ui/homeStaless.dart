
import 'package:flutter/material.dart';
import 'package:flutter_application_counts/ui/homePageStafull.dart';


class HomeStaless extends StatelessWidget {
  const HomeStaless({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contador de numeros',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple),),
      home: HomePageStafull(),
    );
  }
}
