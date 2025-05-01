import 'package:components/data/services.dart/calificacion_service.dart';
import 'package:flutter/material.dart';

final List<String> superheroes = [
  'Acuaman',
  'Superman',
  'Wonder Woman',
  'Spiderman',
  'Constantine',
  'Hulk',
];

class ListViewBuilderScreen extends StatelessWidget {
  const ListViewBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CalificacionService calificacionService = CalificacionService();
    var calificaciones = calificacionService.obtenerCalificaciones();

    int cont = 0;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Listado con ListView.builder'),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Center(
          child: ListView.builder(
            itemCount: calificaciones.length,
            itemBuilder: (context, i) {
              final calificacion = calificaciones[i];
              return Card(
                elevation: 5,
                shadowColor: Colors.amber,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/${calificacion.imagen}',
                    ),
                    radius: 30,
                  ),

                  title: Text('Estudiante : ${calificacion.estudiante}'),
                  subtitle: Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Asignatura : ${calificacion.asignatura}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,

                          //style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Nota : ${calificacion.nota}',
                        ), // Text({calificacion.nota.toString})
                      ],
                    ),
                  ),
                  //    onTap: (){  // Equivalente  al onClick de web
                  //    print('Print desde ONTAP');
                  // },
                  /*trailing: IconButton( //Icono despues del texto sensible al click
                      onPressed: (){
                        print('print desde trailing');
                      },
                      icon: Icon(Icons.arrow_forward_ios),),
								*/
                  trailing: InkWell(
                    onTap: () {
                      print('print desde Inkwell/GestureDetector');
                    },
                    borderRadius: BorderRadius.circular(10),

                    child: const Padding(
                      padding: EdgeInsets.all(0),
                      child: Icon(Icons.more_vert),
                    ),
                  ),
                  /*
                  trailing: PopupMenuButton<String>(
                    icon: const Icon(Icons.arrow_drop_down),
                    onSelected: (value) {
                      print('print from Pop Up Menu Button, opcion ${value}');
                    },
                    itemBuilder:
                        (context) => [
                          const PopupMenuItem(
                            child: Text('Edit'),
                            value: 'Edit',
                          ),
                          const PopupMenuItem(
                            child: Text('Remove'),
                            value: 'Remove',
                          ),
                        ],
                  ),
                  */
                  /*
                  trailing: IconButton(
                    onPressed: () async {
                      bool result = await eliminarElemento(context);
                      if (result) {
                        print('The answer was true');
                      }else{
                        print('The answer was false');
                      }
                    },
                    icon : const Icon(Icons.delete,
                    color: Colors.red,
                  ),
                  ),
									*/
                ),
              );
            },
            // separatorBuilder: (context, index) => const Divider(thickness: 10, height: 30, color: Colors.red,),
          ),
        ),
      ),
    );
  }

  //Asynchonius Funtion
  Future<bool> eliminarElemento(BuildContext context) async {
    bool answer = false;
    answer = await showDialog(
      context: context,
      barrierDismissible: false, // dialogo modal, no click por fuera
      builder: (context) {
        return AlertDialog(
          title: const Text('Are you sure you want to delete this item?'),
          content: Image.asset('assets/question.png', width: 80, height: 80),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('No'),
            ),

            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
    print('Closing the dialog box');
    return answer;
  }
}
