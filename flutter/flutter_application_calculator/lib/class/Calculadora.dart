class Calculadora{

    String a; //1,1
    String b; //1,1
  
    Calculadora(this.a, this.b);

    //2,2 + 2,2 = 4,4
    //2.2 + 2.2 = 4.4

    String sumar(){
      a = a.replaceAll(",", ".");
      b = b.replaceAll(",", ".");
      //1.1
      //1.1

      double s = double.parse(a) + double.parse(b);
      //2.2
      String res = s.toString().replaceAll(".", ",");
      //2,2
      return res;


      //tarea: Solucionar el bug, 1+1 = 2,0. 
    }
}