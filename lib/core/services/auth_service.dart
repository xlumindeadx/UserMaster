// Servicio de autenticación SIMULADO (sin backend).
// Guarda los usuarios en memoria mientras la app esté abierta.

class UserModel {
  final String name;
  final String email;
  final String password;

  const UserModel({
    required this.name,
    required this.email,
    required this.password,
  });
}

class AuthException implements Exception {
  final String message;
  const AuthException(this.message);

  @override
  String toString() => message;
}

class AuthService {
  AuthService._();
  static final AuthService instance = AuthService._();

  final Map<String, UserModel> _users = {};
  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;
  bool get hasUsers => _users.isNotEmpty;

  bool isRegistered(String email) =>
      _users.containsKey(email.trim().toLowerCase());

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2));

    final key = email.trim().toLowerCase();
    if (_users.containsKey(key)) {
      throw const AuthException('Ya existe una cuenta con este correo.');
    }

    _users[key] = UserModel(
      name: name.trim(),
      email: key,
      password: password,
    );
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2));

    if (!hasUsers) {
      throw const AuthException(
        'Aún no hay cuentas registradas. Regístrate primero.',
      );
    }

    final user = _users[email.trim().toLowerCase()];
    if (user == null) {
      throw const AuthException(
        'No existe una cuenta con este correo. Regístrate primero.',
      );
    }
    if (user.password != password) {
      throw const AuthException('La contraseña es incorrecta.');
    }

    _currentUser = user;
    return user;
  }

  Future<void> sendRecoveryLink(String email) async {
    await Future.delayed(const Duration(milliseconds: 800));
    if (!isRegistered(email)) {
      throw const AuthException('No hay ninguna cuenta con este correo.');
    }
  }

  void logout() => _currentUser = null;
}
