class Producto {
  final String? id;
  final String nombre;
  final String descripcion;
  final double precio;
  final int existencia;
  final double porcentajeDescuento;
  final int valoracion;
  final String marca;
  final String modelo;
  final String formaIngreso;
  final String categoria;
  final String ultimoIngreso;
  final bool activo;
  final String imagen;

  // Constructor por defecto
  Producto({
    this.id,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.existencia,
    required this.porcentajeDescuento,
    required this.valoracion,
    required this.marca,
    required this.modelo,
    required this.formaIngreso,
    required this.categoria,
    required this.ultimoIngreso,
    required this.activo,
    required this.imagen,
  });

  // Constructor vacío
  Producto.empty()
      : id = '',
        nombre = '',
        descripcion = '',
        precio = 0.0,
        existencia = 0,
        porcentajeDescuento = 0.0,
        valoracion = 0,
        marca = '',
        modelo = '',
        formaIngreso = '',
        categoria = '',
        ultimoIngreso = '',
        activo = false,
        imagen = '';

  // Constructor a partir de un Map
  factory Producto.fromMap(Map<String, dynamic> map) {
    return Producto(
      id: map['id'] as String?,
      nombre: map['nombre'] as String,
      descripcion: map['descripcion'] as String,
      precio: (map['precio'] as num).toDouble(),
      existencia: map['existencia'] as int,
      porcentajeDescuento: (map['porcentajeDescuento'] as num).toDouble(),
      valoracion: map['valoracion'] as int,
      marca: map['marca'] as String,
      modelo: map['modelo'] as String,
      formaIngreso: map['formaIngreso'] as String,
      categoria: map['categoria'] as String,
      ultimoIngreso: map['ultimoIngreso'] as String,
      activo: (map['activo'] as int) == 1,
      imagen: map['imagen'] as String,
    );
  }

  // Método que convierte la clase a un Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,      
      'nombre': nombre,
      'descripcion': descripcion,
      'precio': precio,
      'existencia': existencia,
      'porcentajeDescuento': porcentajeDescuento,
      'valoracion': valoracion,
      'marca': marca,
      'modelo': modelo,
      'formaIngreso': formaIngreso,
      'categoria': categoria,
      'ultimoIngreso': ultimoIngreso,
      'activo': activo ? 1 : 0,
      'imagen': imagen,
    };
  }

  // Método para verificar si el producto es vacío
  bool isEmpty() {
    return id == '' &&
        nombre.isEmpty &&
        descripcion.isEmpty &&
        precio == 0.0 &&
        existencia == 0 &&
        porcentajeDescuento == 0.0 &&
        valoracion == 0 &&
        marca.isEmpty &&
        modelo.isEmpty &&
        formaIngreso.isEmpty &&
        categoria.isEmpty &&
        ultimoIngreso.isEmpty &&
        !activo &&
        imagen.isEmpty;
  }

  // Método para imprimir la información del producto
  @override
  String toString() {
    return '{id: $id, nombre: $nombre, descripción: $descripcion, precio: \$$precio, existencia: $existencia, % descuento: $porcentajeDescuento, valoración: $valoracion, marca: $marca, modelo: $modelo, forma ingreso: $formaIngreso, categoría: $categoria, último ingreso: $ultimoIngreso, activo: ${activo ? 'Si' : 'No'}, imagen: $imagen}';
  }

  // Método que verifica si el producto está disponible
  // estaDisponible será una propiedad de Producto.
  bool get estaDisponible => existencia > 0;

  // Método que aplica un descuento al precio
  double aplicarDescuento() {
    return precio - (precio * (porcentajeDescuento / 100));
  }

  // ... Métodos de utilida
}