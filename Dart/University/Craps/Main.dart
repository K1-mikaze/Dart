import 'Methods.dart';

void main(){
  bool kill = false;
  do{
    int option = SelectOption("Do you want to start a Game?\n 1. Yes\n 2. Not");
    if(option != 1 ){
      kill = true;
      break;
    }
    print("The Dices has been thrown");
    int DiceThrown = Sum_The_Dice();
    print('\nYou got $DiceThrown');
    if(DiceThrown == 7 || DiceThrown == 11){
      print('Congratulations You Win!!!');
    }else if(DiceThrown == 2 ||DiceThrown == 3 || DiceThrown == 12){
      print('Game Over :((');
      kill = true;
    }else{
      print("You're in your point");
      option = SelectOption("Throw the Dices\n 1. Yes\n 2. Not");
      if(option != 1 ){
        kill = true;
        break;
      }
      print('You need to get $DiceThrown To Win\n');
      while(true){
        option = SelectOption("Throw the Dices\n 1. Yes\n 2. Not");
        if(option != 1 ){
          kill = true;
          break;
        }
        int AnotherTry = Sum_The_Dice();
        print('You got $AnotherTry');
        if(DiceThrown == AnotherTry){
          print('Congratulations You Win!!!');
          kill = true;
          break;
        }else if( AnotherTry == 7){
          print('Game Over :((');
          kill = true;
          break;
        }
      }
    }
  }while(!kill);
}