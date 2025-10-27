import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriaService {

  FirebaseFirestore db =  FirebaseFirestore.instance;

  Future<List> obtenerTodos() async {
    List categorias = [];
    CollectionReference collectionReferenceCategorias = db.collection('categorias');
    QuerySnapshot querySnapshot = await collectionReferenceCategorias.get();

    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> categoria = doc.data() as Map<String, dynamic>;
      categoria['id'] = doc.id;
      categorias.add(categoria);
    }
    return categorias;
  }

  Future<Map<String, dynamic>?> obtenerPorId(String id) async {
    try {
      DocumentSnapshot docSnapshot = await db.collection('categorias').doc(id).get();
      if (docSnapshot.exists) {
        Map<String, dynamic> categoria = docSnapshot.data() as Map<String, dynamic>;
        categoria['id'] = docSnapshot.id;
        return categoria;
      } else {
        return null;
      }
    } catch (e) {
      print('Error al obtener categoria por id: $e');
      return null;
    }
  }  

  // otros métodos de servicio

} // fin de la clase CategoriaService