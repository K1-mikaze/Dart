import 'package:components/config/themes/app_theme.dart';
import 'package:components/utils/validators/text/text_input_validator.dart';
import 'package:flutter/material.dart';
import 'package:components/view/widgetBundle.dart';

class FormScreen2 extends StatefulWidget {
  const FormScreen2({super.key});

  @override
  State<FormScreen2> createState() => _FormScreen2State();
}

class _FormScreen2State extends State<FormScreen2> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController valorationController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController typeTransactionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController lastEntryController = TextEditingController();
  TextEditingController activeController = TextEditingController();
  TextEditingController urlController = TextEditingController();

  bool suiche = false;

  final GlobalKey<FormState> formKey = GlobalKey(); // crer una clave...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nuevo producto',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 10),
              CustomTextForm(
                labelText: 'Nombre del producto',
                controller: nameController,
                keyboardType: TextInputType.text,
                validator:
                    (characters) => TextInputValidator.validateStringSize(
                      characters: characters,
                      minSize: 3,
                      maxSize: 30,
                      ifEmpty: "Este campo no puede estar vacio",
                      wrongSize: "El campo debe tener entre 3 y 30 caracteres",
                    ),
              ),
              const SizedBox(height: 10),
              CustomTextForm(
                labelText: 'Descripcion',
                controller: descriptionController,
                keyboardType: TextInputType.text,
                validator:
                    (characters) => TextInputValidator.validateStringSize(
                      characters: characters,
                      minSize: 10,
                      maxSize: 100,
                      ifEmpty: "Este campo no puede estar vacio",
                      wrongSize:
                          "El campo debe tener entre 10 y 100 caracteres",
                    ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: CustomDropdownButtonForm(
                      labelName: "Categoria",
                      options: [
                        'Muebles y Organizacion',
                        'ElectroHogar',
                        'Herramientas',
                        'Baños y Cocinas',
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),

                  Expanded(
                    flex: 3,
                    child: CustomTextForm(
                      labelText: 'Ultimo Ingreso',
                      controller: lastEntryController,
                      keyboardType: TextInputType.datetime,
                      validator:
                          (value) => TextInputValidator.validateDateTime(
                            characters: value,
                            ifEmpty: "Este campo no puede estar vacio",
                            notDateTime: "Ingresa una Fecha valida",
                          ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: CustomTextForm(
                      labelText: 'Precio',
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      validator:
                          (value) => TextInputValidator.validateOnlyDouble(
                            characters: value,
                            ifEmpty: 'Este campo no puede estar vacio',
                            notNumber: 'Debe ingresar un numero',
                            ifMinSize: 'Debe ser un numero mayor a 0',
                            minSize: 0,
                          ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: CustomTextForm(
                      labelText: '% Descuento',
                      controller: discountController,
                      keyboardType: TextInputType.number,
                      validator:
                          (value) => TextInputValidator.validateOnlyDouble(
                            characters: value,
                            ifEmpty: 'Este campo no puede estar vacio',
                            notNumber: 'Debe ingresar un numero',
                            ifBiggerOrSmaller:
                                "El numero debe ser entre 1 y 100",
                            minSize: 1,
                            maxSize: 100,
                          ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: CustomTextForm(
                      labelText: 'Existencia',
                      controller: stockController,
                      keyboardType: TextInputType.number,
                      validator:
                          (value) => TextInputValidator.validateOnlyInt(
                            characters: value,
                            minSize: 0,
                            ifMinSize: "Debe ser mayor a 0",
                            ifEmpty: 'Este campo no puede estar vacio',
                            notNumber: 'Debe ingresar un numero',
                          ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    flex: 3,
                    child: CustomTextForm(
                      labelText: 'Valoracion',
                      controller: valorationController,
                      keyboardType: TextInputType.number,
                      validator:
                          (value) => TextInputValidator.validateOnlyInt(
                            characters: value,
                            ifEmpty: 'Este campo no puede estar vacio',
                            notNumber: 'Debe ingresar un numero',
                            ifBiggerOrSmaller: "La puntuacion es entre 1-10",
                            minSize: 1,
                            maxSize: 10,
                          ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              CustomTextForm(
                labelText: 'Marca',
                controller: brandController,
                keyboardType: TextInputType.text,
                validator:
                    (value) => TextInputValidator.validateStringSize(
                      characters: value,
                      maxSize: 100,
                      minSize: 0,
                      wrongSize:
                          "El campo no debe contener mas de 100 caracteres",
                      ifEmpty: "Este campo no puede estar vacio",
                    ),
              ),

              const SizedBox(height: 10),

              CustomTextForm(
                labelText: 'Modelo',
                controller: modelController,
                keyboardType: TextInputType.text,
                validator:
                    (value) => TextInputValidator.validateStringSize(
                      characters: value,
                      minSize: 0,
                      maxSize: 100,
                      ifEmpty: "Este campo no puede estar vacio",
                      wrongSize:
                          "El campo no debe contener mas de 100 caracteres",
                    ),
              ),

              const SizedBox(height: 10),

              CustomRadioButtonForm(
                labelText: "Radios",
                radioButtons: ["Compra", "Marca"],
                group: 'Forma de Ingreso',
              ),

              const SizedBox(height: 10),

              CustomSwitchButton(
                title: 'Activo',
                labelText: 'Estado de la venta',
                activeColor: AppTheme.primaryLight,
                value: suiche,
                onChanged: (value) {
                  setState(() {
                    suiche = value;
                  });
                },
              ),

              const SizedBox(height: 10),

              CustomTextForm(
                labelText: 'URL de la Imagen',
                controller: urlController,
                keyboardType: TextInputType.url,
                validator:
                    (value) => TextInputValidator.validateURLhttps(
                      characters: value,
                      ifnotURL: "El contenido obtenido no es una URL valida",
                      ifEmpty: "Este campo no puede estar vacio",
                    ),
              ),

              const SizedBox(height: 10),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: ElevatedButton(
                  style: ButtonStyle(),
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Guardar',
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
}
