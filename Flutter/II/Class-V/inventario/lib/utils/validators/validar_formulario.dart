class ValidarFormulario {

  static String? validarNombre(String? valor) { 
    if (valor == null || valor.trim().isEmpty) {
      return 'El nombre no puede estar vacío';
    } else if (valor.trim().length < 3 || valor.trim().length > 30) {
      return 'Debe tener entre 3 y 30 caracteres';
    }
    return null;
  }

  static String? validarDescripcion(String? valor) { 
    if (valor == null || valor.trim().isEmpty) {
      return 'La descripción no puede estar vacía';
    } else if (valor.trim().length < 5 || valor.trim().length > 40) {
      return 'Debe tener entre 5 y 40 caracteres';
    }
    return null;
  }

  static String? validarTexto(String? valor) { 
    if (valor == null || valor.trim().isEmpty) {
      return 'El texto no puede estar vacío';
    } else if (valor.trim().length < 5 || valor.trim().length > 40) {
      return 'Debe tener entre 5 y 40 caracteres';
    }
    return null;
  }

  static String? validarPrecio(String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'El precio, no puede estar vacío';
    }
    final numValue = num.tryParse(valor);
    if (numValue == null) {
      return 'Debe ser un número';
    }
    if (numValue <= 0) {
      return 'El precio debe ser mayor a 0';
    }
    return null;
  }

  static String? validarExistencia(String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'Existencia requerida';
    }
    final numValue = int.tryParse(valor);
    if (numValue == null) {
      return 'Digite un valor entero';
    }
    if (numValue <= 0) {
      return 'Debe ser mayor que 0';
    }
    return null;
  }

  static String? validarPorcentaje(String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'Porcentaje requerido';
    }
    final numValue = num.tryParse(valor);
    if (numValue == null) {
      return 'Ingrese un valor numérico';
    }
    if (numValue < 1 || numValue > 100) {
      return 'Debe estár entre 1-100';
    }
    return null;
  }


  static String? validarValoracion(String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'Valoración requerida';
    }
    final numValue = int.tryParse(valor);
    if (numValue == null) {
      return 'Ingrese un valor entero';
    }
    if (numValue < 1 || numValue > 10) {
      return 'Valoración entre 1-10';
    }
    return null;
  }

  static String? validarImagen(String? valor) {
    return (valor!.isEmpty) ? "Copie la url de la imagen del producto" : null;
  }

  static String? validarDropdown (valor) => valor == null ? 'Debe seleccionar una opción' : null;
}
