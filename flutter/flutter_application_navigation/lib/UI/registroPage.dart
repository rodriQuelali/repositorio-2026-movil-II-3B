import 'package:flutter/material.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({super.key});

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro Page"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            // Handle button press
            Navigator.pushNamed(context, '/');
          },
          child: Text("Go to Next Registro page"),
        ),
      ),
    );
  }
}