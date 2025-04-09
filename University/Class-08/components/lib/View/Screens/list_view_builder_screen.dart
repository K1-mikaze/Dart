import 'package:components/data/services/calificacion_service.dart';
import 'package:flutter/material.dart';

final List<String> superheroes = [
	'Acuaman',
	'Superman',
	'Wonder Woman',
	'Spiderman',
	
];


class ListViewBuilderScreen extends StatelessWidget{
	const ListViewBuilderScreen({super.key});

	@override
	Widget build(BuildContext context){
		
		CalificacionService calificacionService = new CalificacionService();
		var calificaciones = calificacionService.obtenerCalificaciones();

		int counter = 0;
		return Scaffold(
			appBar:AppBar(centerTitle: true,
			backgroundColor: Colors.amber,
			title: const Text('Listado con ListView simple'),
			),
			body:Center(
				child: ListView.builder(
				itemCount: calificaciones.length,
					itemBuilder: (context,i){
						final calificacion = calificaciones[i];
							return Card(
							elevation: 5,
							shadowColor: Colors.amber,
							child:ListTile(
							leading: Icon(Icons.abc),
							title: Text( calificacion.estudiante),
							subtitle: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [	
								Text(calificacion.asignatura),
								Text(calificacion.nota.toString()),
								],
							),
							),
						);
					},
					//separatorBuilder:(context,i) => const Divider(thickness: 10,height: 30,)
					),
			),
		);
	}



}
