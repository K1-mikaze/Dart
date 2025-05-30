import 'package:components/config/themes/app_theme.dart';
import 'package:components/utils/validators/validar_formulario.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import 'package:intl/intl.dart';

const List<String> opciones = ['Opción 1', 'Opción 2', 'Opción 3', 'Opción 4'];

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController notaController = TextEditingController();
  TextEditingController claveController = TextEditingController();
  TextEditingController correoController = TextEditingController();
  TextEditingController fechaController = TextEditingController();
  TextEditingController imagenController = TextEditingController();

  String opcion = opciones.first;
  String radioboton = 'Radio 1';
  bool suiche = false;

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
              CustomTextForm(
                labelText: 'Nombre',
                controller: nombreController,
                validator: ValidadorFormulario.validarNombre,
              ),
              const SizedBox(height: 12),
              CustomTextForm(
                labelText: 'Nota',
                controller: notaController,
                keyboardType: TextInputType.number,
                validator: ValidadorFormulario.validarNota,
              ),
              const SizedBox(height: 12),
              CustomTextForm(
                labelText: 'Clave',
                controller: claveController,
                obscureText: true,
                validator: ValidadorFormulario.validarClave,
              ),

              const SizedBox(height: 12),

              CustomTextForm(
                labelText: 'Correo',
                controller: correoController,
                keyboardType: TextInputType.emailAddress,
                validator: ValidadorFormulario.validarCorreo,
              ),

              const SizedBox(height: 12),

              opcionesDropdown(),

              const SizedBox(height: 12),
              radios(),

              const SizedBox(height: 12),
              fecha(),

              const SizedBox(height: 12),
              opcionSuiche(),

              const SizedBox(height: 12),
              CustomTextForm(
                labelText: 'Imagen',
                controller: imagenController,
                keyboardType: TextInputType.url,
              ),

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

  Widget opcionesDropdown() {
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

  Widget radios() {
    return InputDecorator(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        labelText: 'Radios',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Column(
        children: [
          RadioListTile(
            value: 'Radio 1',
            groupValue: radioboton,
            onChanged: (value) {
              setState(() {
                radioboton = value ?? 'Radio 1';
                print(value);
              });
            },
            contentPadding: const EdgeInsets.all(0),
            title: const Text('Radio 1'),
          ),
          RadioListTile(
            value: 'Radio 2',
            groupValue: radioboton,
            onChanged: (value) {
              setState(() {
                radioboton = value ?? 'Radio 2';
              });
            },
            contentPadding: const EdgeInsets.all(0),
            title: const Text('Radio 2'),
          ),
        ],
      ),
    );
  }

  Widget fecha() {
    return TextFormField(
      controller: fechaController,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        labelText: 'Fecha',
      ),
      readOnly: true,
      onTap: () async {
        DateTime? fechaPicker = await showDatePicker(
          context: context,
          firstDate: DateTime(2024),
          lastDate: DateTime(2027),
          initialDate: DateTime.now(),
        );
        if (fechaPicker != null) {
          String fecha = DateFormat('yyyy-MM-dd').format(fechaPicker);
          setState(() {
            fechaController.text = fecha;
          });
        } else {
          print('No se ha seleccionado ninguna fecha');
        }
      },
    );
  }

  Widget opcionSuiche() {
    return InputDecorator(
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        labelText: 'Fecha',
      ),
      child: SwitchListTile(
        activeColor: AppTheme.primaryLight,
        value: suiche,
        title: const Text('Suiche'),
        onChanged: (value) {
          setState(() {
            suiche = value;
          });
        },
      ),
    );
  }

  // función interna de validación que sólo aplica para
  // campos del formulario actual
  String? validarNombre(String? valor) {
    if (valor == null) {
      return 'El nombre no puede estar vacío';
    } else if (valor.length < 3 || valor.length > 30) {
      return 'El nombre debe tener entre 3 y 30 caracteres';
    }
    return null;
  }
} // fin de la clase _FormScreenState
