void main(){
  final Cuadrado cuadrado = new Cuadrado();
  cuadrado.lado = 5;

}


//get an set
class Cuadrado{
  // _ es privado, no se puede acceder desde fuera de la clase

  late double _lado;
  //late, ? null, late, son formas de decirle a dart que esa variable se va a inicializar despues
  //double? _area;
  
  set lado(double valor){
    if(valor <= 0){
      throw('uno de los lados no puede ser negativo');
    }

    _lado = valor;
  }

  @override
  String toString() => 'lado es: $_lado';

  double get area{
    return _lado*_lado;
  }  
}
