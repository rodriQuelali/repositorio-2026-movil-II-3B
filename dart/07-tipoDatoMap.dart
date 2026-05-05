void main(){

//mapas, clave y valor
// php, asociativo, diccionario
// pithon diccionario, json

Map<String, String> persona2 = {
  "nombre": "juan",
  "apellido": "perez",
  "edad": "30"
  };
print(persona2);
print(persona2["nombre"]);

String estado = 'soltero';

 Map<String, dynamic> persona ={
    'nombre': 'carlos',
    'edad': 32,
    'soltero': true
  };

//
  print(persona['nombre']);
  print(persona['edad']);
  print(persona[estado]);

  Map<int, dynamic> personas ={
    1: 'carlos',
    2: 'juan',
    3: 'rodri'
  };

  //añadir clave y valor.
  personas.addAll({4:'maria'});
  persona.addAll({'telefono': 123456789});

}