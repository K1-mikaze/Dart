import "dart:math";
import 'dart:io';

int Throw_The_Dice(){
  return Random().nextInt(6) + 1;
}
int Sum_The_Dice(){
  return Throw_The_Dice() + Throw_The_Dice();
}

int SelectOption(String Text) {
  int Option = 0;
  stdout.writeln(Text);
  String Input = stdin.readLineSync() ?? ' '; 
    try {
      Option = int.parse(Input);
    } catch (e) {
      print("It is not a Number \n $e");
      Option = SelectOption(Text);
    }
  return Option;
}