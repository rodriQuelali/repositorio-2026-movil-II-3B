
import 'package:flutter/material.dart';
import 'package:flutter_application_navigation/UI/DetailPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigations"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            // Handle button press
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailPage()),
            );
          },
          child: Text("Go to Next Page"),
        ),
      ),
    );
  }
}