import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventario/data/services/producto_service.dart';

import '../../data/models/models.dart';

class ProductoListScreen extends StatelessWidget {
  const ProductoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListProducto();
  }
}

class ListProducto extends StatefulWidget {
  const ListProducto({super.key});

  @override
  State<ListProducto> createState() => _ListProductoState();
}

class _ListProductoState extends State<ListProducto> {
   ProductoService productoService = ProductoService();

  late Future<List<Producto>> productosFuture;
  final NumberFormat numberFormat = NumberFormat('#,##0', 'es_CO');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Listado de Productos',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: productoService.obtenerTodos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error al cargar productos,\nError: ${snapshot.error}',
                style: const TextStyle(fontSize: 18),
              ),
            );
          }
          else if (!snapshot.hasData) {
            return const Center(
              child: Text(
                'No hay productos disponibles',
                style:  TextStyle(fontSize: 18),
              ),
            );
          }
          final productos = snapshot.data!;
          return Container(
            margin: const EdgeInsets.only(top: 10),
            child: ListView.builder(
              itemCount: productos.length,
              itemBuilder: (context, index) {
                final producto = productos[index];
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.startToEnd,
                  background: Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Eliminando...",
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    ),
                  ),
                  confirmDismiss: (direction) async {
                    bool rta = false;
                    rta = await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Seguro de eliminar el producto ?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  return Navigator.pop(context, false);
                                },
                                child: const Text('No')),
                            TextButton(
                                onPressed: () {
                                  return Navigator.pop(context, true);
                                },
                                child: const Text('Si'))
                          ],
                        );
                      },
                    );
                    return rta;
                  },
                  onDismissed: (direction) {
                    // productoService.eliminar(producto['id']);
                  },
                  child: Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ListTile(
                      title: Text(producto['nombre']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Precio: \$${numberFormat.format(producto['precio'])}'),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.remove_red_eye_sharp, color: Colors.green,),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.edit, color: Colors.blue,),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'productoformscreen',);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
