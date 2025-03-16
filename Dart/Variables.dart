void main(){

  // null-coalescing operator, it's use to provide a default value when a nullable variable is null.
  int? variable;
  int value2 = variable ?? 0;

  // const is not a type varible, it's an indicator that the compiler will guess the type of variable and make it constant
  const aConstNum = 1;

  // final variable is not a type, is used when you are declaring a variable but you don't know it's value until run time
  final int value;

  // int? value make a variable that can contain either an integer or a null
  int? value1;
  value1 = 0;
  value1 = null;

  // var is not a Type variable, it's an indicator to make the compiler guess the type of variable that value will take
  var firstName = 'Sergio';

  String lastName = "Idarraga";

  int amount = 100;

  double coso = 10.0001;

  bool trueoffalse = true;

// dynamic is a type of variable that is able to be changing its type while running the program 
  dynamic hello = "hello";

  var numbers = [1,2,3];

}