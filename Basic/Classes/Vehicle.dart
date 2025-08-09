class Vehicle {
  String model;
  int year;

  Vehicle(this.model,this.year){

  print(this.model);
  print(this.year);
  }

  void showOutput(){
    print(model);
    print(year);
  }

}

class Car extends Vehicle{
  double price;

  Car(String model, int year, this.price): super(model,year);

  //getter
  double get GetPrice => price;

  //Setter
  void SetPrice(double price){
    this.price = price;
  }

  @override
  void showOutput(){
    print(model + "\n" + year.toString() + "\n" + price.toString());
  }
}