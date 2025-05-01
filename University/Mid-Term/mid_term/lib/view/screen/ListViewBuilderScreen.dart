import 'package:flutter/material.dart';
import './../../data/services.dart';

class ListViewBuilderScreen extends StatelessWidget{
const ListViewBuilderScreen({super.key});

@override
  Widget build(BuildContext context) {

    var toDo = AssignmentList().ToDoList();
    var checkColor = Colors.green;
    var textColor = Colors.black;
    bool clicked = false;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('To Do'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Center(
          child: ListView.builder(
            itemCount: toDo.length,
            itemBuilder: (context, i){
              final assignment = toDo[i];
              return Card(
                elevation: 5,
                shadowColor: Colors.black,
                child: ListTile(
                  onTap: (){
                    if(!clicked){
                      checkColor = Colors.red;
                      clicked = true;
                    }else{
                      checkColor = Colors.red;
                      clicked = false;
                    }
                  },
                  leading:CircleAvatar(
                    backgroundImage: AssetImage('assets/${assignment.image}'),
                  ),
                title: Text(assignment.description) ,
                trailing: SizedBox(
                  width: 70,
                  child: Row(
                    children: [
                      Icon(Icons.check,
                        color: checkColor
                      ),
                      IconButton(
                        onPressed: () async {
                          bool result = await eliminarElemento(context);
                          if(result){
                            toDo.removeAt(i);
                          }
                        },
                        icon:Icon(Icons.close,
                        color: Colors.red)
                        
                      ),
                  ],
                  ),
                ),
                ),
              );
            }
            )
            ,),
      ),
    );
  }

  Future<bool> eliminarElemento(BuildContext context) async {
    bool answer = false;
    answer = await showDialog(
      context: context,
      barrierDismissible: false, // dialogo modal, no click por fuera
      builder: (context) {
        return AlertDialog(
          title: const Text('Quieres Eliminar este elemento?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
                answer = false;
              },
              child: const Text('No'),
            ),

            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
                answer = true;
              },
              child: const Text('Si'),
            ),
          ],
        );
      },
    );
    return answer;
  }
}