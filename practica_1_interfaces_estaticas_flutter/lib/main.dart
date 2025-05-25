
import 'package:flutter/material.dart';
import 'pantalla_inicio.dart';
import 'pantalla_perfil.dart';
import 'pantalla_hobbies.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi App Personal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      // Cambiar por PantallaInicio, PantallaPerfil() o PantallaHobbies() para probar
      home: PantallaPerfil(),
    );
  }
}