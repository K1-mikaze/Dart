import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../config/themes/app_theme.dart';
import '../../data/services/services.dart';
import '../../utils/validators/validators.dart';
import '../widgets/widgets.dart';

class ProductoFormScreen extends StatelessWidget {
  const ProductoFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> producto = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    print('*** Llegando desde el ListView un producto: $producto');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Nuevo Producto', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: FormProducto(producto: producto),
    );
  }
}

class FormProducto extends StatefulWidget {
  final Map<String, dynamic> producto;
  const FormProducto({super.key, required this.producto});

  @override
  State<FormProducto> createState() => _FormProductoState();
}

class _FormProductoState extends State<FormProducto> {
  ProductoService productoService = ProductoService();
  CategoriaService categoriaService = CategoriaService();

  final GlobalKey<FormState> formKey = GlobalKey();

  String id = '';

  // controladores
  TextEditingController nombreController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();
  TextEditingController precioController = TextEditingController();
  TextEditingController existenciaController = TextEditingController();
  TextEditingController porcentajeDescuentoController = TextEditingController();
  TextEditingController valoracionController = TextEditingController();
  TextEditingController marcaController = TextEditingController();
  TextEditingController modeloController = TextEditingController();
  TextEditingController ultimoIngresoController = TextEditingController();
  TextEditingController imagenController = TextEditingController();

  // campos de estado
  String formaIngreso = 'Compra';
  bool activo = false;
  Map<String,dynamic>? categoria;
  List<Map<String,dynamic>> categorias = [];

  inicializar(Map<String, dynamic> producto) {
    if (producto.isNotEmpty) {
      id = producto['id'];
      nombreController.text = producto['nombre'];
      descripcionController.text = producto['descripcion'];
      precioController.text = producto['precio'].toString();
      existenciaController.text = producto['existencia'].toString();
      porcentajeDescuentoController.text = producto['porcentajeDescuento'].toString();
      valoracionController.text = producto['valoracion'].toString();
      marcaController.text = producto['marca'];
      modeloController.text = producto['modelo'];
      formaIngreso = producto['formaIngreso'];
      // categoria = producto['categoria'];
      ultimoIngresoController.text = producto['ultimoIngreso'];
      activo = producto['activo'] ? true : false;
      imagenController.text = producto['imagen'];
    }
  }

  Future<void> cargarCategorias() async {
    List data = await categoriaService.obtenerTodos();
    setState(() {
      categorias = data.cast<Map<String, dynamic>>();
      // Si el producto ya tiene una categoría guardada, seleccionarla
      if (widget.producto.isNotEmpty) {
        categoria = categorias.firstWhere(
              (cat) => cat['nombre'] == widget.producto['categoria'],
          orElse: () => {},
        );
      }
    });
  }


  @override
  void initState() {
    super.initState();
    cargarCategorias();
    inicializar(widget.producto);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text('Nuevo producto', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blueGrey),),
              ),
            ),

            const SizedBox(height: 10),            
            CustomTextForm(labelText: 'Nombre del producto', controller: nombreController, validator: ValidarFormulario.validarNombre),

            const SizedBox(height: 10),
            CustomTextForm(labelText: 'Descripción', controller: descripcionController, validator: ValidarFormulario.validarDescripcion),

            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: dropdownCategoria(),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: textUltimoIngreso(),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CustomTextForm(labelText: 'Precio', controller: precioController, validator: ValidarFormulario.validarPrecio, keyboardType: TextInputType.number,),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: CustomTextForm(labelText: '% descuento', controller: porcentajeDescuentoController, validator: ValidarFormulario.validarPorcentaje, keyboardType: TextInputType.number,),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: CustomTextForm(labelText: 'Existencia', controller: existenciaController, validator: ValidarFormulario.validarExistencia, keyboardType: TextInputType.number,),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextForm(labelText: 'Valoración (1-10)', controller: valoracionController, validator: ValidarFormulario.validarValoracion, keyboardType: TextInputType.number,),
                ),
              ],
            ),
            const SizedBox(height: 10),
            CustomTextForm(labelText: 'Marca', controller: marcaController, validator: ValidarFormulario.validarTexto),
            const SizedBox(height: 10),
            CustomTextForm(labelText: 'Modelo', controller: modeloController, validator: ValidarFormulario.validarTexto),
            const SizedBox(height: 10),
            radioFormaIngreso(),
            const SizedBox(height: 10),
            switchActivo(),
            const SizedBox(height: 10),
            CustomTextForm(labelText: 'URL del archivo de imagen', controller: imagenController, keyboardType: TextInputType.url, validator: ValidarFormulario.validarImagen),
            const SizedBox(height: 10),
            buttonGuardar(),
          ],
        ),
      ),
    );
  }

  // funciones que devuelven otros Widgets...
  Widget textUltimoIngreso() {
    return TextFormField(
      controller: ultimoIngresoController,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        labelText: 'Último ingreso',
      ),
      readOnly: true,
      onTap: () async {
        DateTime? fechaPicker = await showDatePicker(
            context: context,
            firstDate: DateTime(2024),
            lastDate: DateTime(2030),
            initialDate: DateTime.now());
        if (fechaPicker != null) {
          String fecha = DateFormat('yyyy-MM-dd').format(fechaPicker);
          ultimoIngresoController.text = fecha;
          setState(() {});
        } else {
          print('No se ha seleccionado ninguna fecha');
        }
      },
    );
  }

  Widget dropdownCategoria() {
    if (categorias.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return DropdownButtonFormField<String>(
      value: categoria?['id'], // usar el id como valor seleccionado
      items: categorias.map((cat) {
        return DropdownMenuItem<String>(
          value: cat['id'], // cada ítem usa su id como valor interno
          child: Text(cat['nombre'] ?? 'Sin nombre'),
        );
      }).toList(),
      onChanged: (idSeleccionado) {
        setState(() {
          // buscar el objeto completo en la lista por su id
          categoria =
              categorias.firstWhere((cat) => cat['id'] == idSeleccionado);
        });
      },
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        labelText: 'Categoría',
        border: OutlineInputBorder(),
      ),
      validator: (value) =>
      value == null ? 'Debe seleccionar una categoría' : null,
    );
  }

  // Widget dropdownCategoria() {
  //   return DropdownButtonFormField(
  //     value: categoria,
  //     items: categorias.map((cat) {
  //       return DropdownMenuItem(
  //         value: cat,
  //         child: Text(cat),
  //       );
  //     }).toList(),
  //     onChanged: (value) {
  //       setState(() {
  //         categoria = value as String;
  //       });
  //     },
  //     decoration: const InputDecoration(
  //         contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
  //         labelText: 'Categoría',
  //         border: OutlineInputBorder()),
  //     validator: (value) =>
  //         value == null ? 'Debe seleccionar una categoría' : null,
  //   );
  // }

  Widget radioFormaIngreso() {
    return InputDecorator(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        labelText: 'Forma de ingreso',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Column(
        children: [
          RadioListTile(
            contentPadding: const EdgeInsets.all(0),
            title: const Text('Compra'),
            value: 'Compra',
            groupValue: formaIngreso,
            onChanged: (value) {
              setState(() {});
              formaIngreso = value ?? 'Compra';
            },
          ),
          RadioListTile(
            contentPadding: const EdgeInsets.all(0),
            title: const Text('Intercambio'),
            value: 'Intercambio',
            groupValue: formaIngreso,
            onChanged: (value) {
              setState(() {});
              formaIngreso = value ?? 'Compra';
            },
          ),
        ],
      ),
    );
  }

  Widget switchActivo() {
    return InputDecorator(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        labelText: 'Estado de la venta',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: SwitchListTile(
        activeColor: AppTheme.primary,
        title: const Text('Activo'),
        value: activo,
        onChanged: (value) {
          setState(() {
            activo = value;
          });
        },
      ),
    );
  }

  Widget buttonGuardar() {
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: ElevatedButton(
        onPressed: () {
          if (!formKey.currentState!.validate()) {
            return;
          } 
          else {
            Map<String, dynamic> producto = fromForm();
            if (id.isEmpty) {
              productoService.agregar(producto);
            }
            else {
              productoService.actualizar(producto, id);
            }
            Navigator.pop(context);           
          }
        },
        child: const Text(
          'Guardar',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Map<String, dynamic> fromForm() {
    return {
      'nombre': nombreController.text,
      'descripcion': descripcionController.text,
      'precio': double.parse(precioController.text),
      'existencia': int.parse(existenciaController.text),
      'porcentajeDescuento': double.parse(porcentajeDescuentoController.text),
      'valoracion': int.parse(valoracionController.text),
      'marca': marcaController.text,
      'modelo': modeloController.text,
      'formaIngreso': formaIngreso,
      'categoria': categoria?['id'] ?? '',
      'ultimoIngreso': ultimoIngresoController.text,
      'activo': activo,
      'imagen': imagenController.text,
    };
  }
}
