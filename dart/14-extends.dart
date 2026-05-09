void main(){
//extends

 final superman = new Heroe();
  superman.nombre = "clar Ken";
  superman.mostrarNombre();

  final lutor = new Villano();
  lutor.nombre = "lex lutor";
}

abstract class Personaje {
  String? poder;
  String? nombre;

  void mostrarNombre() => print("nombre: $nombre");
}

class Heroe extends Personaje {
  
  int? valentia;
  
}

class Villano extends Personaje {
  int? maldad;
}