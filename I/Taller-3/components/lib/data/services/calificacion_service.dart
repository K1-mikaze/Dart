import 'package:components/data/models/calificacion.dart';

class CalificacionService {
  List<Calificacion> calificaciones = [];

  CalificacionService() {
    calificaciones.add(
      Calificacion(
        estudiante: 'Juan Gil',
        asignatura: 'Algoritmos 1',
        nota: 3.1,
        imagen: 'juan_gil.jpg',
      ),
    );
    calificaciones.add(
      Calificacion(
        estudiante: 'María Paz',
        asignatura: 'Algoritmos 1',
        nota: 4.2,
        imagen: 'maria_paz.jpeg',
      ),
    );
    calificaciones.add(
      Calificacion(
        estudiante: 'Juan Gil',
        asignatura: 'Desarrollo de Software',
        nota: 4.0,
        imagen: 'juan_gil.jpg',
      ),
    );
    calificaciones.add(
      Calificacion(
        estudiante: 'Olga Rey',
        asignatura: 'Humanidades 1',
        nota: 2.9,
        imagen: 'olga_rey.jpg',
      ),
    );
  }

  List<Calificacion> obtenerCalificaciones() {
    return calificaciones;
  }
}
