import 'package:components/utils/validators/validar_formulario.dart';
import 'package:components/view/widgets/widgets.dart';
import 'package:flutter/material.dart';

const List<String> opciones = ['Opcion 1', 'Opcion 2', 'Opcion 3', 'Opcion 4'];

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController pruebaController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController notaController = TextEditingController();
  TextEditingController claveController = TextEditingController();
  TextEditingController correoController = TextEditingController();

  String opcion = opciones.first;

  final GlobalKey<FormState> formKey = GlobalKey(); // crer una clave...

  @override
  Widget build(BuildContext context) {
    // pruebaController.text = 'Probando un controller text';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Título de FormScreen'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 12),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Controles generales',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              TextFormField(
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                controller: pruebaController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Debe agregar un texto';
                  } else {
                    return null;
                  }
                },
                // autofocus: true,
                // initialValue: 'Un texto inicial',
                onChanged: (value) {
                  print(value);
                },
                decoration: const InputDecoration(
                  hintText: 'Texto de ayuda',
                  labelText: 'Etiqueta (flotante)',
                  helperText: 'Texto ayuda',
                  counterText: 'x de y caracteres',
                  suffixIcon: Icon(Icons.rectangle_outlined),
                  prefixIcon: Icon(Icons.person_2_outlined),
                  icon: Icon(Icons.group),
                  border: OutlineInputBorder(
                    // borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              CustomTextField(
                labelText: 'Nombre',
                controller: nombreController,
                validator: ValidadorFormulario.validarNombre,
              ),

              const SizedBox(height: 12),

              CustomTextField(
                labelText: 'Nota',
                controller: notaController,
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 12),

              CustomTextField(
                labelText: 'Clave',
                controller: claveController,
                obscureText: true,
                validator: ValidadorFormulario.validarClave,
              ),

              const SizedBox(height: 12),

              CustomTextField(
                labelText: 'Correo',
                controller: correoController,
                keyboardType: TextInputType.emailAddress,
                validator: ValidadorFormulario.validarCorreo,
              ),

              const SizedBox(height: 12),

              opcionesDropDown(),

              const SizedBox(height: 12),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: ElevatedButton(
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Ejecutar acción',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget opcionesDropDown() {
    return DropdownButtonFormField(
      value: opcion,
      items:
          opciones.map((op) {
            return DropdownMenuItem(value: op, child: Text(op));
          }).toList(),
      onChanged: (value) {
        setState(() {
          opcion = value as String;
        });
      },
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        labelText: 'Opciones',
        border: OutlineInputBorder(),
      ),
      validator: ValidadorFormulario.validarDropdown,
    );
  }
}
