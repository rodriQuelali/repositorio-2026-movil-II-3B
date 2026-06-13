
//los estados de mi diseño.

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_calculator/class/Calculadora.dart';

class HomePageCalculator extends StatefulWidget {
  const HomePageCalculator({super.key});

  @override
  State<HomePageCalculator> createState() => _HomePageCalculatorState();
}

class _HomePageCalculatorState extends State<HomePageCalculator> {
  //tarea es leer todo el codigo y entenderlo.

  // Controlador para capturar el valor de la caja de texto
  TextEditingController txtNumeroController = TextEditingController();
  String verValor = "Ver Operación";

  String valorTexto = "";
  String verResultado = "Ver Resultado";

  String operacionSeleccionada = ""; // Variable para almacenar la operación seleccionada

  // Colores principales para el tema oscuro
  final Color bgColor = const Color(0xFF1A1A1A);
  final Color btnNumColor = const Color(0xFF333333);
  final Color btnOpColor = const Color(0xFFFF9800); // Naranja para operadores
  final Color btnActionColor = const Color(0xFF505050); // Gris claro para acciones extra

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text("Calculadora", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // --- ZONA DE PANTALLA Y TEXTFIELD ---
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '$verValor',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: txtNumeroController,
                    style: const TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Ingrese número",
                      labelStyle: const TextStyle(color: Colors.grey, fontSize: 18),
                      filled: true,
                      fillColor: Colors.black26,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$verResultado',
                    style: TextStyle(color: Colors.white54, fontSize: 20),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            
            // --- ZONA DE BOTONES ---
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  button741(),
                  button852(),
                  button963(),
                  buttonOperadores(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // --- FUNCIONES WIDGET PARA COLUMNAS ---

  Widget button741() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton("7", btnColor: btnNumColor, onPressed: (){
            
            txtNumeroController.text += "7";

          }),
          _buildButton("4", btnColor: btnNumColor, onPressed:(){
            txtNumeroController.text += "4";
          }),
          _buildButton("1", btnColor: btnNumColor, onPressed:(){
            txtNumeroController.text += "1";
          }),
          _buildButton(",", btnColor: btnActionColor, onPressed: (){
            txtNumeroController.text += ",";
          }),
        ],
      ),
    );
  }

  Widget button852() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton("8", btnColor: btnNumColor, onPressed: (){
            txtNumeroController.text += "8";
          }),
          _buildButton("5", btnColor: btnNumColor, onPressed: (){
            txtNumeroController.text += "5";
          }),
          _buildButton("2", btnColor: btnNumColor, onPressed: (){
            txtNumeroController.text += "2";
          }),
          _buildButton("0", btnColor: btnNumColor, onPressed: (){
            txtNumeroController.text += "0";
          }),
        ],
      ),
    );
  }

  Widget button963() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton("9", btnColor: btnNumColor, onPressed: (){
            txtNumeroController.text += "9";
          }),
          _buildButton("6", btnColor: btnNumColor, onPressed: (){
            txtNumeroController.text += "6";
          }),
          _buildButton("3", btnColor: btnNumColor, onPressed: (){
            txtNumeroController.text += "3";
          }),
          _buildButton("=", btnColor: btnOpColor, onPressed: () {
            //tarea para el resta, y limpiar los valores.

            setState(() {
              if(operacionSeleccionada == "+") {

                Calculadora calculadora = Calculadora(valorTexto, txtNumeroController.text);
                verValor += txtNumeroController.text;
                verResultado = "Resultado: ${calculadora.sumar()}";

              }if(operacionSeleccionada == "-") {
                verResultado = "Resultado: ${double.parse(valorTexto) - double.parse(txtNumeroController.text)}";
              }

              txtNumeroController.text = "";
            });
            /*ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Valor de la caja de texto: ${txtNumeroController.text}'),
                backgroundColor: btnOpColor,
              ),
            );*/
          }),
        ],
      ),
    );
  }

  Widget buttonOperadores() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton("÷", btnColor: btnActionColor, txtColor: btnOpColor),
          _buildButton("×", btnColor: btnActionColor, txtColor: btnOpColor),
          _buildButton("-", btnColor: btnActionColor, txtColor: btnOpColor, onPressed: (){
            //la seleccion dela operacion
            operacionSeleccionada = "-";
            valorTexto = txtNumeroController.text;
            setState(() {
              verValor = txtNumeroController.text + "-";
              txtNumeroController.text = "";
            });
          }),
          _buildButton("+", btnColor: btnActionColor, txtColor: btnOpColor, onPressed: (){
            //la seleccion dela operacion
            operacionSeleccionada = "+";
            valorTexto = txtNumeroController.text;
            setState(() {
              verValor = txtNumeroController.text + "+";
              txtNumeroController.text = "";
            });
          }),
        ],
      ),
    );
  }

  // --- FUNCIÓN REUTILIZABLE PARA CREAR BOTONES ---
  // Esto evita repetir el código de ElevatedButton decenas de veces.
  Widget _buildButton(String label, {required Color btnColor, Color txtColor = Colors.white, VoidCallback? onPressed}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0), // Espacio entre botones
        child: ElevatedButton(
          onPressed: onPressed ?? () {}, 
          style: ElevatedButton.styleFrom(
            backgroundColor: btnColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16), // Bordes redondeados profesionales
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: txtColor,
            ),
          ),
        ),
      ),
    );
  }
}