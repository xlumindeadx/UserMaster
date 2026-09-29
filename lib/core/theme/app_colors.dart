import 'package:flutter/material.dart';

/// Paleta de colores global de UserMaster.
/// Todo el azul de la app sale de aquí para que sea siempre el mismo.
class AppColors {
  AppColors._();

  // Azul principal (el mismo del Splash: Colors.blue)
  static const Color primary = Color(0xFF2196F3);
  static const Color primaryDark = Color(0xFF1976D2);
  static const Color primaryLight = Color(0xFFE3F2FD);
  static const Color primaryDisabled = Color(0xFF90CAF9);

  // Fondos
  static const Color background = Color(0xFFF5F7FA);
  static const Color surface = Colors.white;

  // Textos
  static const Color textPrimary = Color(0xFF1F2937);
  static const Color textSecondary = Color(0xFF6B7280);

  // Bordes
  static const Color border = Color(0xFFE0E0E0);

  // Estados
  static const Color success = Color(0xFF2E7D32);
  static const Color error = Color(0xFFD32F2F);
  static const Color warning = Color(0xFFF59E0B);
  static const Color white = Colors.white;
}
