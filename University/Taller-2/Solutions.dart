import 'dart:math';

import 'Producto.dart';
import 'Producto2.dart';

void ThirdExercise(){
  print(' | '+ 'Codigo'.padRight(6) + ' | ' + 'Descripcion'.padRight(30) + ' | ' + 'Precio'.toString().padRight(10) +' | ' + 'Existencia'.padRight(10)+ ' | '
      'Total inventario'.padRight(30));
  var List = [Producto('B456', 'Memoria USB Kingston 64GB', 87000, 43),Producto('H945','Movil Samsung S20 FE', 1935000, 9)];
  for(Producto thing in List){
    print(thing.ToString());
  }
}

void FourthExercise(){


  var MapList = [Producto('B456', 'Memoria USB Kingston 64GB', 87000, 43).ToMap(),Producto('H945','Movil Samsung S20 FE', 1935000, 9).ToMap()];
  for(var Mapthing in MapList){
    print(Mapthing);
  }
}

void FifthExercise(){
  final inventario = [
    Producto2(categoria: 'Almacenamiento', descripcion: 'Disco duro SSD Kingston', precio: 198000, existencia: 21),
    Producto2(categoria: 'Audio', descripcion: 'Audífono Sony inalámbrico bluetooth', precio: 369000, existencia: 7),
    Producto2(categoria: 'Video', descripcion: 'Televisor Sony 32 pulgadas LED', precio: 1188000, existencia: 10),
    Producto2(categoria: 'Video', descripcion: 'Monitor Samsung 24 pulgadas', precio: 790000, existencia: 17),
    Producto2(categoria: 'Accesorio', descripcion: 'Multipuerto Targus 3.1', precio: 98500, existencia: 32),
    Producto2(categoria: 'Almacenamiento', descripcion: 'Memoria USB 3.2 64Gb', precio: 75000, existencia: 29),
  ];

  Map<String, double> totalbycategory = CalculateByCategory(inventario);

  totalbycategory.forEach((category, total) {
    print('Categoría: $category, Total: \$${total.toStringAsFixed(2)}');
  });

}

void main(){

  //First Exercise
  void perimetroRectangulo(int largo,int ancho)=> print('El perimetro del rectangulo es: ' + (2 * (largo * ancho)).toString());

  //Second Exercise
  double distancia({double x1 = 0,double y1 = 0,double x2 = 0,double y2 = 0}){
    final d= sqrt(pow((x2 - x1), 2) + pow((y2-y1),2));
    return d;
  }


  FifthExercise();



}