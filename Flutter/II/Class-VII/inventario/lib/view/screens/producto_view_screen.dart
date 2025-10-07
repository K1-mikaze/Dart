import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/models/models.dart';

class ProductoViewScreen extends StatefulWidget {
  const ProductoViewScreen({super.key});

  @override
  State<ProductoViewScreen> createState() => _ProductoViewScreenState();
}

class _ProductoViewScreenState extends State<ProductoViewScreen> {
  final NumberFormat numberFormat = NumberFormat('#,##0', 'es_CO');

  @override
  Widget build(BuildContext context) {
    Producto producto = Producto.empty();

    const textStyleBold = TextStyle(fontSize: 17.5, fontWeight: FontWeight.bold);
    const textStyleNormal = const TextStyle(fontSize: 17.5);
    const espacio = 6.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Producto - Consulta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      producto.nombre,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Descripción:',
                      style: textStyleBold,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        producto.descripcion,
                        style: textStyleNormal,
                      ),
                    ),
                    const SizedBox(
                      height: espacio,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Precio: ',
                          style: textStyleBold,
                        ),
                        Text(
                          '\$${numberFormat.format(producto.precio)}',
                          style: textStyleNormal,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: espacio,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Porcentaje de descuento: ',
                          style: textStyleBold,
                        ),
                        Text(
                          '${producto.porcentajeDescuento}%',
                          style: textStyleNormal,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: espacio,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Existencia: ',
                                style: textStyleBold,
                              ),
                              Text(
                                '${producto.existencia}',
                                style: textStyleNormal,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Valoración: ',
                                style: textStyleBold,
                              ),
                              Text(
                                '${producto.valoracion}/10',
                                style: textStyleNormal,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: espacio,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Categoría: ',
                          style: textStyleBold,
                        ),
                        Text(
                          producto.categoria,
                          style: textStyleNormal,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: espacio,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Marca: ',
                          style: textStyleBold,
                        ),
                        Text(
                          producto.marca,
                          style: textStyleNormal,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: espacio,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Modelo: ',
                          style: textStyleBold,
                        ),
                        Text(
                          producto.modelo,
                          style: textStyleNormal,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: espacio,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Fecha de último ingreso: ',
                          style: textStyleBold,
                        ),
                        Text(
                          producto.ultimoIngreso,
                          style: textStyleNormal,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: espacio,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Forma de ingreso: ',
                          style: textStyleBold,
                        ),
                        Text(
                          producto.formaIngreso,
                          style: textStyleNormal,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: espacio,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Producto activo? ',
                          style: textStyleBold,
                        ),
                        Text(
                          producto.activo ? 'Si' : 'No',
                          style: textStyleNormal,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: espacio,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            if (producto.imagen != null)
            Card(
              clipBehavior: Clip.antiAlias,
              child: Image(
                image: NetworkImage(producto.imagen),
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
