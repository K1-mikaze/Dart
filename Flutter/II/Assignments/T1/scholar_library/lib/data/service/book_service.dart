import 'package:scholar_library/data/models.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BookService {
  Future<Database> get database async {
    return openDatabase(
      join(await getDatabasesPath(), 'scholar_library.db'),
      version: 1,
      onCreate: (db, version) => db.execute('''
          CREATE TABLE LIBRO(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          titulo TEXT,
          anio INTEGER,
          autorid INTEGER, 
          editorialid INTEGER,
          disponible INTEGER,

          FOREIGN KEY(autorid) REFERENCES AUTOR(id),
          FOREIGN KEY(editorialid) REFERENCES EDITORIAL(id)
        )

        CREATE TABLE AUTOR(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nombre TEXT,
          pais TEXT
        )

        CREATE TABLE EDITORIAL(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nombre TEXT,
          direccion TEXT
        )
      '''),
    );
  }

  Future<void> insertBook(Book book) async {
    Database db = await database;
    await db.insert('LIBRO', book.toMap());
  }

  // Future<void> insertAutor(Autor autor) async {
  //   Database db = await database;
  //   await db.insert('AUTOR', autor.toMap());
  // }
  //
  // Future<void> insertEditorial(Editorial editorial) async {
  //   Database db = await database;
  //   await db.insert('EDITORIAL', editorial.toMap());
  // }

  Future<List<Book>> obtenerTodos() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('LIBRO');

    maps.forEach(
      (p) => print(
        "### ${p['id']}, ${p['tittle']}, ${p['anio']}, ${p['autorid']}, ${p['editorialid']},${p['available']}",
      ),
    );
    return List.generate(maps.length, (i) => Book.fromMap(maps[i]));
  }

  Future<void> eliminarPorId(int? id) async {
    Database db = await database;
    await db.delete('LIBRO', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> actualizar(Book book) async {
    print('*** Llegando producto desde la vista: $book');
    Database db = await database;
    await db.update(
      'LIBRO',
      book.toMap(),
      where: 'id = ?',
      whereArgs: [book.id],
    );
  }

  Future<void> eliminarTodos() async {
    Database db = await database;
    await db.delete('productos');
    print(
      '*** Todos los productos de la base de datos comercial.db fueron eliminados',
    );
  }

  Future<void> elimnarBaseDeDatos() async {
    var rutaDB = await getDatabasesPath();
    String path = join(rutaDB, 'comercial.db');
    await deleteDatabase(path);
    print('*** Base de datos comercial.db eliminada');
  }
} // fin de la clase
