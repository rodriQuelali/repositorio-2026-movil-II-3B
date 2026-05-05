void main(){
  //funciones

  saludar();
  print(sumar());
}



void saludar(){
  print("hola");
}

int sumar(){
  return 2 + 2;
}

int restar(int a, int b){
  return a - b;
}

//funcion flecha/ o en una sola linea.
int multipliacion (int a, int b) => a*b;