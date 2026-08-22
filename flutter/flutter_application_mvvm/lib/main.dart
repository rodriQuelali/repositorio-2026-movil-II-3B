import 'package:flutter/material.dart';
import 'package:flutter_application_mvvm/view/home_page_view.dart';
import 'package:flutter_application_mvvm/view/login_view.dart';
import 'package:flutter_application_mvvm/view/register_view.dart';
import 'package:flutter_application_mvvm/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        
      ],
      child: MaterialApp(
        title: 'Aplicaction the MVVM',
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        ),

        initialRoute: '/',
        routes: {
          '/': (context) => const LoginView(),
          '/home': (context) => const HomePage(),
          '/register': (context) => const RegisterView(),
        },
      ),
    );
  }
}

