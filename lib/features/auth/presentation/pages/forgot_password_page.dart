import 'package:flutter/material.dart';

import '../../../../core/services/auth_service.dart';
import '../../../../core/utils/app_snackbar.dart';
import '../../../../core/utils/validators.dart';
import '../widgets/auth_layout.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _correoController = TextEditingController();

  bool _enviando = false;

  @override
  void dispose() {
    _correoController.dispose();
    super.dispose();
  }

  Future<void> _enviarEnlace() async {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;

    setState(() => _enviando = true);

    try {
      await AuthService.instance.sendRecoveryLink(_correoController.text);
      if (!mounted) return;
      AppSnackBar.success(
        context,
        'Enlace de recuperación enviado a ${_correoController.text.trim()}',
      );
    } on AuthException catch (e) {
      if (!mounted) return;
      AppSnackBar.error(context, e.message);
    } finally {
      if (mounted) setState(() => _enviando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Recuperar contraseña',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: AuthLayout(
        imagePath: 'assets/images/recuperar.jpg',
        title: '¿Olvidaste tu contraseña?',
        subtitle: 'Ingresa tu correo electrónico y te enviaremos '
            'un enlace para recuperar tu contraseña.',
        children: [
          Form(
            key: _formKey,
            child: CustomTextField(
              controller: _correoController,
              label: 'Correo electrónico',
              hint: 'ejemplo@correo.com',
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              validator: Validators.email,
              onFieldSubmitted: (_) => _enviarEnlace(),
            ),
          ),
          const SizedBox(height: 25),
          PrimaryButton(
            text: 'Enviar enlace de recuperación',
            icon: Icons.send_outlined,
            isLoading: _enviando,
            onPressed: _enviarEnlace,
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Volver al Login',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
