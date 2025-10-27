import 'package:inventario/data/models/models.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductoService {

  FirebaseFirestore db =  FirebaseFirestore.instance;

  Future<List> obtenerTodos() async {
    List productos = [];
    CollectionReference collectionReferenceProductos = db.collection('productos');
    QuerySnapshot querySnapshot = await collectionReferenceProductos.get();

    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> producto = doc.data() as Map<String, dynamic>;
      producto['id'] = doc.id;
      productos.add(producto);
    }
    return productos;
  }

  Future<void> eliminarPorId(String id) async {
    await db.collection('productos').doc(id).delete();
  }

  Future<void> agregar(Map<String, dynamic> producto) async {
    await db.collection('productos').add(producto);
  }

  Future<void> actualizar(Map<String, dynamic> producto, String id) async {
    await db.collection('productos').doc(id).set(producto);
  }

} // fin de la clase ProductoService
