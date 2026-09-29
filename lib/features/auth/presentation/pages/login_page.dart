import 'package:flutter/material.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/services/auth_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_snackbar.dart';
import '../../../../core/utils/validators.dart';
import '../widgets/auth_layout.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _correoController = TextEditingController();
  final _contrasenaController = TextEditingController();

  bool _cargando = false;

  @override
  void dispose() {
    _correoController.dispose();
    _contrasenaController.dispose();
    super.dispose();
  }

  Future<void> _ingresar() async {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;

    setState(() => _cargando = true);

    try {
      // Simula la carga de 2 segundos y valida contra los usuarios registrados.
      await AuthService.instance.login(
        email: _correoController.text,
        password: _contrasenaController.text,
      );

      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
    } on AuthException catch (e) {
      if (!mounted) return;
      setState(() => _cargando = false);
      AppSnackBar.error(context, e.message);
    }
  }

  Future<void> _irARegistro() async {
    // El registro devuelve el correo creado para rellenar el campo.
    final correo = await Navigator.pushNamed(context, AppRoutes.register);
    if (correo is String && mounted) {
      _correoController.text = correo;
      _contrasenaController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthLayout(
        imagePath: 'assets/images/login.jpg',
        title: 'Bienvenido',
        subtitle: 'Inicia sesión para continuar',
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  controller: _correoController,
                  label: 'Correo electrónico',
                  hint: 'ejemplo@correo.com',
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.email,
                ),
                const SizedBox(height: 18),
                CustomTextField(
                  controller: _contrasenaController,
                  label: 'Contraseña',
                  hint: 'Ingresa tu contraseña',
                  icon: Icons.lock_outline,
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                  validator: Validators.loginPassword,
                  onFieldSubmitted: (_) => _ingresar(),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.forgotPassword),
              child: const Text(
                '¿Olvidaste tu contraseña?',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(height: 10),
          PrimaryButton(
            text: 'Ingresar',
            icon: Icons.login,
            isLoading: _cargando,
            onPressed: _ingresar,
          ),
          const SizedBox(height: 20),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const Text(
                '¿No tienes una cuenta?',
                style: TextStyle(color: AppColors.textSecondary),
              ),
              TextButton(
                onPressed: _cargando ? null : _irARegistro,
                child: const Text(
                  'Registrarse',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
