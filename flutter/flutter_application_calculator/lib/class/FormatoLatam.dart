class FormatoLatam{

  String parseoComaPunto(String num){
        return num.replaceAll(",", ".");
    }

  String parseoNuemroEntero(double a){
    if(a % 1 == 0){
      return a.toInt().toString();

    }
    return a.toString().replaceAll(".", ",");
    
  }

}