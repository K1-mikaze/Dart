import 'package:inventario/data/models/models.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ProductoService {
  Future<Database> get database async {
    return openDatabase(
      join(await getDatabasesPath(), 'comercial.db'),
      version: 1,
      onCreate: (db, version) => db.execute('''
          CREATE TABLE productos (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nombre TEXT,
          descripcion TEXT,
          precio REAL,
          existencia INTEGER,
          porcentajeDescuento REAL,
          valoracion INTEGER,
          marca TEXT,
          modelo TEXT,
          formaIngreso TEXT,
          categoria TEXT,
          ultimoIngreso TEXT,
          activo INTEGER,
          imagen TEXT
        )
      '''),
    );
  }

  Future<void> insertar(Producto producto) async {
    Database db = await database;
    await db.insert("productos", producto.toMap());
  }

  Future<List<Producto>> obtenerProducts() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query("");
    maps.forEach((e) => print("### ${e['id']}\n${e['nombre']}"));

    return List.generate(maps.length, (i) => Producto.fromMap(maps[i]));
  }
}
