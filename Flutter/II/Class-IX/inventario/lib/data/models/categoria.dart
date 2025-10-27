class Categoria {
  final String? id;
  final String nombre;
  final String ubicacion;

  Categoria({
    this.id, 
    required this.nombre, 
    required this.ubicacion
  });

  Categoria.empty()
    : id = '',
      nombre = '',
      ubicacion = '';

  // constructor a partir de un Map
  factory Categoria.fromMap(Map<String, dynamic> map) {
    return Categoria(
      id: map['id'] as String?,
      nombre: map['nombre'] as String,
      ubicacion: map['ubicacion'] as String,
    );
  }

  // Método que convierte la clase a un Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,      
      'nombre': nombre,
      'ubicacion': ubicacion,
    };
  }

  // método para verificar si el producto es vacío
  bool isEmpty() {
    return id == '' &&
        nombre.isEmpty &&
        ubicacion.isEmpty;
  }

  // Método para imprimir la información del producto
  @override
  String toString() {
    return '{id: $id, nombre: $nombre, ubicacion: $ubicacion}';
  }  
}