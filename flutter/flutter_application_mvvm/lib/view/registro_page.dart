import 'package:flutter/material.dart';

class ListaPedidosPage extends StatefulWidget {
  const ListaPedidosPage({super.key});

  @override
  State<ListaPedidosPage> createState() => _ListaPedidosPageState();
}

class _ListaPedidosPageState extends State<ListaPedidosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("HOLA LISTA DE PEDIDOS>>>>"),
    );
  }
}