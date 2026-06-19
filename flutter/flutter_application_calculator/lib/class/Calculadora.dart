
import 'package:flutter_application_calculator/class/FormatoLatam.dart';

class Calculadora{

    String a; 
    String b; 
    FormatoLatam formatoLatam = FormatoLatam();
  
    Calculadora(this.a, this.b);

    String sumar(){
      
      a = formatoLatam.parseoComaPunto(a);
      b = formatoLatam.parseoComaPunto(b);
    
      double s = double.parse(a) + double.parse(b);

      return formatoLatam.parseoNuemroEntero(s);
  
    }

}