import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventario/config/routes/app_route.dart';
import 'package:inventario/data/models/models.dart';
import 'package:inventario/data/services/services.dart';

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

  final NumberFormat numberFormat = NumberFormat('#,##0','es_CO');

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
      body: FutureBuilder( future: productosFuture ,
      builder: (context,snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }else if ( snapshot.hasError ){
          return Center(
            child: Text('Error al Cargar Productos:\n${snapshot.error}',
            style: TextStyle(fontSize: 18),),
          );
        }
        else if( snapshot.hasData ||snapshot.data!.isEmpty){
          return Center(
          child: Text('No hay productos Disponibles',
          style: TextStyle(fontSize: 18),)
          );
        }
        final productos = snapshot.data;
        return Container(
          margin: const EdgeInsets.only(
            top: 10,
            ),
          child:  ListView.builder(
            itemCount: productos!.length,
            itemBuilder: (context,i){
              final producto = productos[i];
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: ListTile(
                  title: Text(producto.nombre),
                  trailing: IconButton(
                  icon:Icon(Icons.delete,color:Colors.red,),
                  onPressed: (){ 
                    productoService.eliminarPorId(producto.id);
                    setState(() {
                      cargarDatos();
                    });
                    },
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Precio:\$${numberFormat.format(producto.precio)}"),
                    ],
                  ),
                ),
              );
            },
          ),
          );
      },),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoute.productoFormScreen)
          .then((value){setState(() {
            cargarDatos();
          });});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
