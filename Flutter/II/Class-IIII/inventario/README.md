Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ListTile(
                      title: Text(producto.nombre),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Precio: \$${numberFormat.format(producto.precio)}'),
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          productoService.eliminarPorId(producto.id);
                          setState(() {
                            cargarDatos();
                          });
                        },
                        icon: Icon(Icons.delete, color: Colors.red,)
                      ),
                    ),                  
                );
