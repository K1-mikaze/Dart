import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductoService {

  Future<List<dynamic>> obtenerTodos() async{

    final response = await http.get(Uri.parse('http://10.0.2.2:3000/productos'));
    if(response.statusCode == 200){
      print(jsonDecode(utf8.decode(response.bodyBytes)));
      return jsonDecode(utf8.decode(response.bodyBytes));
    }else{
      throw Exception('Error consultando Datos, error en el envio: \n${response.statusCode}');
    }

  }
}
