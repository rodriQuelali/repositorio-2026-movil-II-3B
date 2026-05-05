void main(){
Heroe heroe1 = Heroe("superman", "volar");
print(heroe1.toString());

}

class Heroe{

  String nombre;
  String poder;
   //constructor
  Heroe(this.nombre, this.poder);

  //antigua forma

  // Heroe ({String nombre='sin nombre', String poder}){
  //   this.nombre = nombre;
  //   this.poder = poder;
  // }
  //override, sobre escribir un metodo, 
  //en este caso el toString,
  // para mostrar la informacion del objeto.

  @override
  String toString(){
    return "nombre: $nombre, poder: $poder";
  }



}