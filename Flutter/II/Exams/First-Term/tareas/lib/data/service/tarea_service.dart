import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tareas/data/models.dart';

class TareaService {
  Future<Database> get database async {
    return openDatabase(
      join(await getDatabasesPath(), 'tareas.db'),
      version: 1,
      onCreate: (db, version) => db.execute('''
          CREATE TABLE TAREA(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          descripcion TEXT,
          estaHecho INTEGER
        )
      '''),
    );
  }

  Future<void> insertar(Tarea tarea) async {
    Database db = await database;
    Map<String, dynamic> map = tarea.toMap();
    map.remove('id');
    await db.insert('TAREA', map);
  }

  Future<void> actualizar(Tarea tarea) async {
    Database db = await database;
    await db.update(
      'TAREA',
      tarea.toMap(),
      where: 'id = ?',
      whereArgs: [tarea.id],
    );
  }

  Future<List<Tarea>> obtenerTodos() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('TAREA');
    return List.generate(maps.length, (i) => Tarea.fromMap(maps[i]));
  }

  Future<void> eliminarPorId(int? id) async {
    Database db = await database;
    await db.delete('TAREA', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> elimnarBaseDeDatos() async {
    var rutaDB = await getDatabasesPath();
    String path = join(rutaDB, 'tareas.db');
    await deleteDatabase(path);
  }
}
