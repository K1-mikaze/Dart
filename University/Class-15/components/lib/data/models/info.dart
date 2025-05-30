class Info {
  final int? id;
  final String nombre;
  final double nota;
  final String clave;
  final String correo;
  final String fecha;
  final String opcionDropdown;
  final String opcionRadio;
  final bool suiche;
  final String imagen;

  Info({
    required this.id,
    required this.nombre,
    required this.nota,
    required this.clave,
    required this.correo,
    required this.fecha,
    required this.opcionDropdown,
    required this.opcionRadio,
    required this.suiche,
    required this.imagen,
  });

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'nota': nota,
      'clave': clave,
      'correo': correo,
      'fecha': fecha,
      'opcionDropdown': opcionDropdown,
      'opcionRadio': opcionRadio,
      'suiche ': suiche ? 1 : 0,
      'imagen': imagen,
    };
  }

  @override
  String toString() {
    return '{id: $id, nombre: $nombre, nota: $nota, clave: $clave, correo: $correo, ...}';
  }
}
