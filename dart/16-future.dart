void main(List<String> args) {
 print('Estamos pediendo datos ');


 httpGet('https://api.nada.com/aliens').then((value) => print(value));

 print('Ultima Linea'); 
}

//se llaman como promezas con parando con 
//javascript

Future<String> httpGet (String url){
  return Future.delayed(new Duration( seconds: 3), (){
    return 'hello word';
  });
}
