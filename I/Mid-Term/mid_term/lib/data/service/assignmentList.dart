import 'package:mid_term/data/model/assignment.dart';

class AssignmentList {
  List<Assignment> assigments = [];

  AssignmentList(){
    assigments = [
      Assignment(description: 'Comprar víveres', image: 'carrito.png'),
      Assignment(description: 'Estudiar para el examen', image: 'estudiante.png'),
      Assignment(description: 'Llamar al doctor', image: 'telefono.png'),
      Assignment(description: 'Almorzar con los amigos', image: 'almuerzo.png'),
      Assignment(description: 'Ir al gimnasio', image: 'gimnasio.png'),
      Assignment(description: 'Practicar ejercicios de Flutter', image: 'flutter.png'),
    ];
  }

  List<Assignment> ToDoList(){
    return assigments;
  }


}