// Ejercicio #1
void Even_Numbers(){
  int value = 0;
  while(true){
    if (value%2==0){
      print(value);
      value++;
    }
  }
}

// Ejercicio #2
void Factorial_Number(int Number_Find,[int value = 1,int count = 1]){
  value = value * count;
  if(value == Number_Find){
    print("El factorial del numero es : $count");
  }else if(value > Number_Find){
    print("El numero no tiene un factorial en los naturales");
  }else {
    Factorial_Number(Number_Find, value,count+1);
  }
}

// Ejercicio #3

void main(){
  Factorial_Number(24);
}