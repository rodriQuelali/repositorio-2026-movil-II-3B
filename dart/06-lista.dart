void main(){
    //vectores
    // no naitivamente, c++.

    //listas 
    //lista de tipo String
    List<String> nombres = ["juan", "pedro", "maria"];

    //lista de tipo int
    List<int> numeros = [1, 2, 3, 4, 5];

    List<Object> mixto = [1, "hola", 3.14, true];

//mas utilizado en flutter
    List<dynamic> dinamico = [1, "hola", 3.14, true];
    dinamico.add("nuevo elemento");
    print(dinamico);



//lista de tamaño fijo
  var maasNumeros = new List.filled(10, null);
  //o
  List masNumeros = List.filled(10, null);
  print(maasNumeros);



}