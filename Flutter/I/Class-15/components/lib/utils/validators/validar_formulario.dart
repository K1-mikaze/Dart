import 'package:flutter/material.dart';

class ValidadorFormulario {
  static String? validarNombre(String? valor) {
    if (valor == null || valor.trim().isEmpty) {
      return 'El nombre no puede estar vacío';
    } else if (valor.trim().length < 3 || valor.trim().length > 30) {
      return 'Debe tener entre 3 y 30 caracteres';
    }
    return null;
  }

  static String? validarNota(String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'La nota no puede estar vacía';
    }
    final numValue = num.tryParse(valor);
    if (numValue == null) {
      return 'Debe ser un número';
    }
    if (numValue < 0 || numValue > 100) {
      return 'La nota debe estar entre 0 y 100';
    }
    return null;
  }

  static String? validarClave(String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'La contraseña es obligatoria';
    }
    if (valor.length < 6) {
      return 'Debe tener al menos 6 caracteres';
    }
    return null;
  }

  // otros validadores... por ejemplo el de email
  static String? validarCorreo(String? valor) {
    if (valor == null || valor.trim().isEmpty) {
      return 'El correo es obligatorio';
    }
    final regex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w{2,4}$');
    if (!regex.hasMatch(valor)) {
      return 'Formato de correo inválido';
    }
    return null;
  }

  static String? validarDropdown(valor) =>
      valor == null ? 'Debe seleccionar una opción' : null;
}
