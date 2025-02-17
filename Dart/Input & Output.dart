import 'dart:io';

void main() {
  stdout.writeln("What  is your name: ?");
  var name = stdin.readLineSync();
  print("My name is $name");

  stdout.writeln("Write a number");
  int number = stdin.readByteSync();
  print("this is a number $number");
}