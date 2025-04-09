import 'package:flutter/material.dart';

class ListVIewSimpleScreen extends StatelessWidget{
const ListVIewSimpleScreen({super.key});

	@override
	Widget build(BuildContext context){
		int counter = 0;
		return Scaffold(
		appBar: AppBar(
			title: const Text('Material App Bar'),
		),
		body: Padding(
						padding: const EdgeInsets.all(10.0),
						child:ListView(
							children: [
								Text('Texto N ${++counter}',style: TextStyle(fontSize:20,color: Colors.indigo),),
								Text('Text N ${++counter}'),
								Align(
									alignment: Alignment.topLeft,
									child: Icon(Icons.ac_unit_sharp)
								),
								Text('Text N ${++counter}'),
								],
								),
		),
	);
	}
}
