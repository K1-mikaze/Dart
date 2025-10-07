class Tarea {
  final int? id;
  String descripcion;
  bool estaHecho;

  Tarea({required this.id, required this.descripcion, required this.estaHecho});

  factory Tarea.fromMap(Map<String, dynamic> map) {
    return Tarea(
      id: map['id'] as int?,
      descripcion: map['descripcion'] as String,
      estaHecho: map['estaHecho'] as int == 0 ? false : true,
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'descripcion': descripcion, 'estaHecho': estaHecho};
  }

  bool isEmpty() {
    return id == 0 && descripcion.isEmpty && estaHecho == false;
  }

  void setDescripcion(String descripcion) {
    this.descripcion = descripcion;
  }

  void setEstaHecho(bool estaHecho) {
    this.estaHecho = estaHecho;
  }

  Tarea copy(bool estaHecho, {String descripcion = ''}) {
    Tarea tareaActualizada = Tarea(
      id: id,
      descripcion: descripcion,
      estaHecho: estaHecho,
    );
    if (descripcion.trim().isEmpty) {
      tareaActualizada.setDescripcion(this.descripcion);
    }
    if (!estaHecho && !this.estaHecho) {}
    return tareaActualizada;
  }
}
