import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scholar_library/data/models.dart';
import 'package:intl/intl.dart';
import 'package:scholar_library/data/service/book_service.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BookList();
  }
}

class BookList extends StatefulWidget {
  const BookList({super.key});

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  BookService bookService = BookService();

  late Future<List<Book>> futureBooks;

  void loadBooks() async {
    futureBooks = bookService.obtenerTodos();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Listado"), centerTitle: true),
      body: FutureBuilder(
        future: futureBooks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error al cargar Libros ${snapshot.error}"),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No hay Libros Disponibles"));
          }
          final books = snapshot.data!;
          return Container(
            margin: const EdgeInsets.only(top: 10),
            child: ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, i) {
                final book = books[i];
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {
                    bookService.eliminarPorId(book.id);
                  },
                  background: Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Eliminando..."),
                    ),
                  ),
                  confirmDismiss: (direction) async {
                    bool answer = false;
                    answer = await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            'Seguro quieres borrar el elemento?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: const Text('No'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: const Text('Si'),
                            ),
                          ],
                        );
                      },
                    );
                    return answer;
                  },
                  child: Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ListTile(
                      title: Text(book.tittle),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text("Año :${book.year}\n")],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
