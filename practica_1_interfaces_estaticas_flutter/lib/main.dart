
import 'package:flutter/material.dart';
import 'pantalla_inicio.dart';
import 'pantalla_perfil.dart';
import 'pantalla_hobbies.dart';

/*
    Autor: Rodrigo Emerson Infanzon Acosta
    Curso: Programacion De Dispositivos Moviles
    Semestre: VI
    Fecha: 25/05/2025
    Ultima modificacion: 25/05/2025 15:46 pm
*/

/*
    Crear tres interfaces gráficas en Flutter, sin programación de lógica, 
    para practicar el uso de widgets como Text, Image, Column, Row, Padding y Container. 
    Cada interfaz representa una pantalla diferente de una aplicación personal.
    En esta tarea no se necesita navegar entre pantallas. Solo debes diseñar cada una por separado.

    Pantalla de inicio: 
    - Un titulo que diga "Bienvenido"
    - Un subtitulo que diga "¡Bienvenido a mi aplicación personal!"
    - Un subtitulo que diga "Aquí podrás conocer más sobre mí, mis intereses y mis proyectos"
    - Un botón que diga "Ver mi perfil"
    - Un botón que diga "Ver Hobbies"

    Pantalla de perfil:
    - Un titulo que diga "Perfil"
    - Un subtitulo que diga "¡Bienvenido a mi perfil!"
    - Un subtitulo que diga "Aquí podrás conocer más sobre mí, mis intereses y mis proyectos"
    - Un botón que diga "Ver mi perfil"
    - Un botón que diga "Ver Hobbies"

    Pantalla de hobbies:
    - Un titulo que diga "Hobbies"
    - Un subtitulo que diga "¡Bienvenido a mis hobbies!"
    - Un subtitulo que diga "Aquí podrás conocer más sobre mí, mis intereses y mis proyectos"
    - Un botón que diga "Ver mi perfil"
    - Un botón que diga "Ver Hobbies"
*/

// Clase principal de la aplicación
void main() {
  runApp(const MyApp());
}

// Clase principal de la aplicación
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Clave del widget

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi App Personal', // Titulo de la aplicación
      theme: ThemeData(
        primarySwatch: Colors.blue, // Color del tema
        fontFamily: 'Roboto', // Fuente del tema
      ),
      // Cambiar por PantallaInicio, PantallaPerfil() o PantallaHobbies() para probar
      home: PantallaPerfil(),
    );
  }
}