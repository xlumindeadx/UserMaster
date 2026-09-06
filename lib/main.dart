import 'package:flutter/material.dart';

import 'features/splash/presentation/pages/splash.dart';
import 'features/auth/presentation/pages/login.dart';
import 'features/auth/presentation/pages/registro.dart';
import 'features/auth/presentation/pages/recordar_contra.dart';
import 'features/dashboard/presentation/pages/dasboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',

      // MODO CLARO
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),

      initialRoute: '/',

      routes: {
        '/': (context) => const SplashPage(),

        '/login': (context) => const Login(),

        '/registro': (context) => const Register(),

        '/recuperar': (context) =>
            const ForgotPassword(),

        '/dashboard': (context) =>
        Dashboard(),
      },
    );
  }
}