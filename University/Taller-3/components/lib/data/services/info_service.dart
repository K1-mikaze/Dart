import 'package:components/data/models/info.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class InfoService {
  Future<Database> get database async {
    return openDatabase(
      join(await getDatabasesPath(), 'informacion.db'),
      version: 1,
      onCreate:
          (db, version) => db.execute('''
CREATE TABLE info (
id INTEGER PRIMARY KEY AUTOINCREMENT,
nombre TEXT,
clave TEXT,
correo TEXT,
fecha TEXT,
opcionDropdown TEXT,
opcionRadio TEXT,
suiche INTEGER,
imagen TEXT
)
			'''),
    );
  }

  Future<void> insert(Info info) async {
    Database db = await database;
    db.insert('info', info.toMap());
  }
}
