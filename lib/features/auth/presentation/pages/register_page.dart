import 'package:flutter/material.dart';

import '../../../../core/services/auth_service.dart';
import '../../../../core/utils/app_snackbar.dart';
import '../../../../core/utils/validators.dart';
import '../widgets/auth_layout.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _correoController = TextEditingController();
  final _contrasenaController = TextEditingController();
  final _confirmarController = TextEditingController();

  bool _cargando = false;

  @override
  void dispose() {
    _nombreController.dispose();
    _correoController.dispose();
    _contrasenaController.dispose();
    _confirmarController.dispose();
    super.dispose();
  }

  Future<void> _crearCuenta() async {
    FocusScope.of(context).unfocus();
    // Aquí se valida que las contraseñas coincidan (Validators.confirmPassword)
    if (!_formKey.currentState!.validate()) return;

    setState(() => _cargando = true);

    try {
      await AuthService.instance.register(
        name: _nombreController.text,
        email: _correoController.text,
        password: _contrasenaController.text,
      );

      if (!mounted) return;
      AppSnackBar.success(
        context,
        'Cuenta creada correctamente. Ahora inicia sesión.',
      );
      // Vuelve al Login enviando el correo registrado.
      Navigator.pop(context, _correoController.text.trim().toLowerCase());
    } on AuthException catch (e) {
      if (!mounted) return;
      setState(() => _cargando = false);
      AppSnackBar.error(context, e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Crear cuenta',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: AuthLayout(
        imagePath: 'assets/images/registro.jpg',
        title: 'Regístrate',
        subtitle: 'Completa los datos para crear tu cuenta',
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  controller: _nombreController,
                  label: 'Nombre completo',
                  icon: Icons.person_outline,
                  textCapitalization: TextCapitalization.words,
                  validator: Validators.name,
                ),
                const SizedBox(height: 18),
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
                  hint: 'Mínimo 6 caracteres, letras y números',
                  icon: Icons.lock_outline,
                  isPassword: true,
                  validator: Validators.newPassword,
                ),
                const SizedBox(height: 18),
                CustomTextField(
                  controller: _confirmarController,
                  label: 'Confirmar contraseña',
                  icon: Icons.lock_reset_outlined,
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                  validator: (v) => Validators.confirmPassword(
                    v,
                    _contrasenaController.text,
                  ),
                  onFieldSubmitted: (_) => _crearCuenta(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          PrimaryButton(
            text: 'Crear cuenta',
            icon: Icons.person_add,
            isLoading: _cargando,
            onPressed: _crearCuenta,
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: _cargando ? null : () => Navigator.pop(context),
            child: const Text(
              'Ya tengo una cuenta',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
