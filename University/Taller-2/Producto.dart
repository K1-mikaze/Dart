class Producto{

  String Codigo;
  String Descripcion;
  double Precio;
  int Existencia;

  Producto(this.Codigo,this.Descripcion,this.Precio,this.Existencia){
  }

  Map<String,dynamic> ToMap(){
    return {
      'Codigo' : Codigo,
      'Descripcion' : Descripcion,
      'Precio' : Precio,
      'Existencia' : Existencia
    };
  }

  @override
  String ToString(){
    return ' | '+ Codigo.padRight(6) + ' | ' + Descripcion.padRight(30) + ' | ' + Precio.toString().padRight(10) +' | ' + Existencia.toString().padRight(10)+ ' | '
        + (Precio * Existencia).toString().padRight(30);
  }

}
