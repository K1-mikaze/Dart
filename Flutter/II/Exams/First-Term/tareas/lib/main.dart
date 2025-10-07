import 'package:flutter/material.dart';
import 'package:tareas/data/models.dart';
import 'package:tareas/data/service/tarea_service.dart';
import 'package:tareas/view/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TareaService tareaService = TareaService();
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController tareaController = TextEditingController();

  late Future<List<Tarea>> tareasFuture;

  @override
  void initState() {
    super.initState();
    cargarDatos();
  }

  void cargarDatos() {
    setState(() {
      tareasFuture = tareaService.obtenerTodos();
    });
  }

  void guardarTarea() {
    if (!formKey.currentState!.validate()) return;

    final nuevaTarea = Tarea(
      id: 0,
      descripcion: tareaController.text.trim(),
      estaHecho: false,
    );

    tareaService
        .insertar(nuevaTarea)
        .then((_) {
          tareaController.clear();
          cargarDatos();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Tarea agregada')));
        })
        .catchError((error) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error: $error')));
        });
  }

  void _toggleTareaEstado(Tarea tarea) {
    final tareaActualizada = tarea.copy(!tarea.estaHecho);
    tareaService
        .actualizar(tareaActualizada)
        .then((_) {
          cargarDatos();
        })
        .catchError((error) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error: $error')));
        });
  }

  Future<bool> confirmarEliminar(Tarea tarea) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Confirmar eliminación'),
            content: Text('¿Eliminar la tarea "${tarea.descripcion}"?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Eliminar'),
              ),
            ],
          ),
        ) ??
        false;
  }

  void eliminarTarea(Tarea tarea) {
    tareaService
        .eliminarPorId(tarea.id)
        .then((_) {
          cargarDatos();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Tarea eliminada')));
        })
        .catchError((error) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error: $error')));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tareas'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextForm(
                      labelText: "Nueva Tarea",
                      controller: tareaController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Por favor ingresa una tarea';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: guardarTarea,
                    icon: const Icon(Icons.add),
                    style: IconButton.styleFrom(foregroundColor: Colors.purple),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: FutureBuilder<List<Tarea>>(
                future: tareasFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error al cargar tareas\n${snapshot.error}',
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text(
                        'No hay tareas disponibles',
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  }

                  final tareas = snapshot.data!;
                  return ListView.builder(
                    itemCount: tareas.length,
                    itemBuilder: (context, index) {
                      final tarea = tareas[index];
                      return Dismissible(
                        key: ValueKey(tarea.id),
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        confirmDismiss: (direction) => confirmarEliminar(tarea),
                        onDismissed: (direction) => eliminarTarea(tarea),
                        child: Card(
                          child: ListTile(
                            title: Text(
                              tarea.descripcion,
                              style: TextStyle(
                                decoration: tarea.estaHecho
                                    ? TextDecoration.lineThrough
                                    : null,
                                color: tarea.estaHecho
                                    ? Colors.grey
                                    : Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            trailing: Checkbox(
                              value: tarea.estaHecho,
                              onChanged: (_) {
                                _toggleTareaEstado(tarea);
                              },
                            ),
                            onTap: () {
                              _toggleTareaEstado(tarea);
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
