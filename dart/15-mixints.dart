void main(){
 final pato = new Pato();
  pato.volar();

  final pezVolador = new PezVolador();
  pezVolador.volar();
}

abstract class Animal{}

abstract class Mamiferos extends Animal{}

abstract class Ave extends Animal{}

abstract class Pez extends Animal{}

//van a ser mis mixins
abstract mixin class Volar{
  //String nombre = "Animal volador";
  void volar() => print("estoy volando");
}

abstract mixin class Caminante{
  void caminar() => print("estoy Caminando");
}

abstract mixin class Nadador{
  void nadar() => print("estoy Nadando");
}

class Delfin extends Mamiferos with Nadador{}

class Murcielago extends Mamiferos with Caminante, Volar {}

class Gato extends Mamiferos with Caminante {}

class Paloma extends Ave with Caminante, Volar {}

class Pato extends Ave with Caminante, Volar, Nadador {}

class Tiburon extends Pez with Nadador {}

class PezVolador extends Pez with Nadador, Volar {}

//tarea es ejemplo de Futte, async y await.
