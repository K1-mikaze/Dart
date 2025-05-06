import 'package:components/data/services.dart/calificacion_service.dart';
import 'package:flutter/material.dart';

class ListViewBuilderScreen extends StatelessWidget {
  const ListViewBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CalificacionService calificacionService = CalificacionService();
    var calificaciones = calificacionService.obtenerCalificaciones();

    return Scaffold(
      appBar: AppBar(
        title: Text('Listado con ListView Builder'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: calificaciones.length,
            itemBuilder: (context, i) {
              final calificacion = calificaciones[i];
              return Card(
                elevation: 3,
                shadowColor: Colors.amber,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/${calificacion.imagen}',
                    ),
                    radius: 30,
                  ),
                  title: Text('Estudiante: ${calificacion.estudiante}'),
                  subtitle: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Asignatura: ${calificacion.asignatura}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text('Calificación: ${calificacion.nota}'),
                      ],
                    ),
                  ),
                  // onTap: () {},  // -> clic en todo el card
                  // trailing: IconButton( // -> clic solo en el ícono sin padding
                  //   onPressed: () {},
                  //   icon: Icon(Icons.arrow_forward_ios),
                  // ),
                  // trailing: InkWell( // GestureDetector // -> envolver un elemento en un clic
                  //   onTap: () {
                  //     print('Hola con InkWell/GestureDetector');
                  //   },
                  //   borderRadius: BorderRadius.circular(20),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(0),
                  //     child: Icon(Icons.more_vert),
                  //   ),
                  // ),
                  // trailing: PopupMenuButton<String>(
                  //   // -> envolver un elemento en un clic
                  //   icon: Icon(Icons.arrow_drop_down),
                  //   onSelected: (value) {
                  //     print(value);
                  //   },
                  //   itemBuilder:
                  //       (context) => [
                  //         PopupMenuItem(value: 'editar', child: Text('Editar')),
                  //         PopupMenuItem(
                  //           value: 'eliminar',
                  //           child: Text('Eliminar'),
                  //         ),
                  //       ],
                  // ),
                  trailing: IconButton(
                    onPressed: () async {
                      bool resultado = await eliminarElemento(context);
                      if (resultado) {
                        print('La respuesta fue verdadera');
                      } else {
                        print('La respuesta fue falsa');
                      }
                    },
                    icon: Icon(Icons.delete),
                  ),
                ),
              );
            },
            // separatorBuilder: (context, index) => Divider(thickness: 2, height: 10, color: Colors.red,),
          ),
        ),
      ),
    );
  }

  Future<bool> eliminarElemento(BuildContext context) async {
    bool rta = false;
    rta = await showDialog(
      context: context,
      barrierDismissible: false, // Evita cerrar tocando fuera del diálogo
      builder: (context) {
        return AlertDialog(
          title: const Text("¿Seguro de eliminar el item?"),
          content: Image.asset('assets/question.png', width: 80, height: 80),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false); // ⛔ Cancelar
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true); // ✅ Confirmar
              },
              child: const Text('Sí'),
            ),
          ],
        );
      },
    );
    print('Cerrando elemento...');
    return rta;
  }
}
