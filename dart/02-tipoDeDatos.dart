import 'dart:ffi';

void main(){
    // tipo de datos
    // int
    int edad = 25;

    // double
    double altura = 1.65;


    // String
    String nombre = "Rodrigo";
    print(nombre.length);
    print(nombre[0]);

    // bool
    bool estado = true;

    //dyanamic --- cambia de tipos de en ejecucion
    dynamic variableDinamica = "Hola";
    variableDinamica = 123;


    // var
    var variableVar = "Hola Mundo";

    //parceo de datos
    String numeroString = "123";
    int numeroInt = int.parse(numeroString);
    print(numeroInt + 30);




}