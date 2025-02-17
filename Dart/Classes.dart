class Num{
  int num = 10;
}


void main() {

  var n = Num();
  int number;

  //if(n != null){
    //number = n.num;
  //}

  // the sign ? will ask if n is an object and if it is accesible
  number = n?.num ?? 0;
 // the sign ?? will make it the value as default if the before value is not suitable

  // this is throwing an error because you have initialize the variable
  print(number);
  
}