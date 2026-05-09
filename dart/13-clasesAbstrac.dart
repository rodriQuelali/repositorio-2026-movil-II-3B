
/**
 * las clases abstractas, son clase que no se permiten
 * hacer instancias de ello
 * cuando utilizamos extends, solo metodos tenemos que implementar
 * cuando utilizamos implements, se implememta tod incluido propiedades y metodos
 * 
 * tambien se utiliza polimorfismo.
 */


void main(){
  final perro = new Perro();
  final gato = new Gato();

  perro.emitirSonido();
  gato.emitirSonido();

}

abstract class Animal {
  
  late int patas;

  void emitirSonido();

}

//final 

class Perro implements Animal {

  late int patas;
  late int colas;

  @override
  void emitirSonido() => print("guauuuuu...");
  
}

class Gato extends Animal {

  late int patas;
  
  @override
  void emitirSonido() => print("miaaaaauuuu...");
  
  
}