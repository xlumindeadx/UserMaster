/// Validaciones reutilizables para los formularios.
class Validators {
  Validators._();

  static final RegExp _emailRegex =
      RegExp(r'^[\w\.\-+]+@[a-zA-Z\d\-]+(\.[a-zA-Z\d\-]+)*\.[a-zA-Z]{2,}$');
  static final RegExp _nameRegex = RegExp(r"^[a-zA-ZáéíóúÁÉÍÓÚñÑüÜ' ]+$");

  static String? name(String? value) {
    final v = value?.trim() ?? '';
    if (v.isEmpty) return 'Ingresa tu nombre completo';
    if (!_nameRegex.hasMatch(v)) return 'El nombre solo puede tener letras';
    if (v.split(RegExp(r'\s+')).length < 2) {
      return 'Ingresa nombre y apellido';
    }
    return null;
  }

  static String? email(String? value) {
    final v = value?.trim() ?? '';
    if (v.isEmpty) return 'Ingresa tu correo electrónico';
    if (!_emailRegex.hasMatch(v)) return 'Ingresa un correo válido';
    return null;
  }

  /// Contraseña para iniciar sesión.
  static String? loginPassword(String? value) {
    if (value == null || value.isEmpty) return 'Ingresa tu contraseña';
    if (value.length < 6) return 'Mínimo 6 caracteres';
    return null;
  }

  /// Contraseña al registrarse (más estricta).
  static String? newPassword(String? value) {
    if (value == null || value.isEmpty) return 'Ingresa una contraseña';
    if (value.contains(' ')) return 'No puede contener espacios';
    if (value.length < 6) return 'Mínimo 6 caracteres';
    if (!RegExp(r'[A-Za-z]').hasMatch(value)) {
      return 'Debe tener al menos una letra';
    }
    if (!RegExp(r'\d').hasMatch(value)) {
      return 'Debe tener al menos un número';
    }
    return null;
  }

  static String? confirmPassword(String? value, String original) {
    if (value == null || value.isEmpty) return 'Confirma tu contraseña';
    if (value != original) return 'Las contraseñas no coinciden';
    return null;
  }
}
