import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventario/config/routes/app_route.dart';
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

  void cargarDatos() async {
    productosFuture = productoService.obtenerTodos();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    cargarDatos();
  }

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
        future: productosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error al cargar productos,\nError: ${snapshot.error}',
                style: const TextStyle(fontSize: 18),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'No hay productos disponibles',
                style: const TextStyle(fontSize: 18),
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
                  onDismissed: (direction) {
                    productoService.eliminarPorId(producto.id);
                  },
                  background: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: const Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: Text(
                        "Eliminando...",
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    ),
                  ),

                  confirmDismiss: (direction) async {
                    bool respuesta = false;
                    respuesta = await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            "Seguro que quiere eliminar el producto?",
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
                    return respuesta;
                  },
                  child: Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: ListTile(
                      title: Text(producto.nombre),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Precio: \$${numberFormat.format(producto.precio)}',
                          ),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove_red_eye_sharp,
                              color: Colors.blue,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                AppRoute.productoFormScreen,
                                arguments: producto,
                              );
                            },
                            icon: Icon(Icons.edit, color: Colors.green),
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
          Navigator.pushNamed(context, AppRoute.productoFormScreen).then(
            (value) => setState(() {
              cargarDatos();
            }),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
