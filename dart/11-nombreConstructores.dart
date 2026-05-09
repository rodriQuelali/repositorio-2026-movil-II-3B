import 'dart:convert';
void  main(){
   //realizo una peticion a una api.
  //no devulev el formato JSON
  final rawjson = '{"nombre": "logan", "poder": "regeneracion"}';

  Map parsedJson = json.decode(rawjson);
  //encode

   final wolverin = new Heroe.fromJson(parsedJson);
    print(wolverin.nombre);
    print(wolverin.poder);
    print(parsedJson);

    // laa instyanccia de cada objeto, de los datos de json
    //
    //
}

class Heroe{

  String? nombre;
  String? poder;

  Heroe( this.nombre,  this.poder);
 
  @override
  String toString(){
    return "nombre: $nombre, poder: $poder";
  }


  Heroe.fromJson(Map parsedJson){
    nombre = parsedJson['nombre'];
    poder = parsedJson['poder'];
  }

}

