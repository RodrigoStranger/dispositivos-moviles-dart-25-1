import 'package:flutter/material.dart';

/// Pantalla principal de la aplicación que muestra una bienvenida y opciones de navegación.
class PantallaInicio extends StatelessWidget {
  /// Crea una instancia de [PantallaInicio].
  const PantallaInicio({super.key}); // Clave del widget

  static const _appBarTitle = 'Bienvenido'; // Titulo de la barra de aplicacion
  static const _welcomeTitle = '¡Bienvenido a mi aplicación personal!'; // Titulo de la bienvenida
  static const _welcomeSubtitle = 
      'Aquí podrás conocer más sobre mí, mis intereses y mis proyectos'; // Subtitulo de la bienvenida
  static const _buttonWidthFactor = 0.6; // Factor de ancho del botón
  static const _buttonBorderRadius = 30.0; // Radio del borde del botón
  static const _buttonElevation = 5.0; // Elevación del botón
  static const _buttonIconSize = 24.0; // Tamaño del icono del botón
  static const _buttonTextSize = 18.0; // Tamaño del texto del botón
  static const _featureIconSize = 30.0; // Tamaño del icono de la característica
  static const _featureBoxSize = 10.0; // Tamaño de la caja de la característica

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(), // Barra de aplicacion
      body: _buildBody(context), // Cuerpo de la pantalla
    );
  }

  /// Construye la barra de aplicación.
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text(
        _appBarTitle,
        style: TextStyle(
          fontSize: 22, // Tamaño de la fuente
          fontWeight: FontWeight.bold, // Peso de la fuente
          color: Colors.white, // Color de la fuente
        ),
      ),
      backgroundColor: Colors.blue, // Color de la barra de aplicacion
      elevation: 4, // Elevacion de la barra de aplicacion
      centerTitle: true, // Centrar el titulo
    );
  }

  /// Construye el cuerpo principal de la pantalla.
  Widget _buildBody(BuildContext context) {
    return Container(
      width: double.infinity, // Ancho de la pantalla
      height: double.infinity, // Alto de la pantalla
      color: Colors.white, // Color de la pantalla
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0), // Espaciado interno
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Alineacion del contenido
              children: [
                _buildWelcomeCard(), // Tarjeta de bienvenida
                const SizedBox(height: 40), // Espaciado interno
                _buildButton(
                  context: context, // Contexto de la pantalla
                  onPressed: () {}, // Accion del botón
                  icon: Icons.person_outline, // Icono del botón
                  label: 'Ver mi perfil', // Etiqueta del botón
                ),
                const SizedBox(height: 20), // Espaciado interno
                _buildButton(
                  context: context, // Contexto de la pantalla
                  onPressed: () {}, // Accion del botón
                  icon: Icons.favorite_outline, // Icono del botón
                  label: 'Ver Hobbies', // Etiqueta del botón
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Construye la tarjeta de bienvenida.
  Widget _buildWelcomeCard() {
    return Container(
      padding: const EdgeInsets.all(20), // Espaciado interno
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.9), // Color de la tarjeta
        borderRadius: BorderRadius.circular(20), // Radio de la tarjeta
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1), // Color de la sombra
            blurRadius: 10, // Radio de la sombra
            offset: const Offset(0, 5), // Offset de la sombra
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            _welcomeTitle, // Titulo de la bienvenida
            textAlign: TextAlign.center, // Alineacion del contenido
            style: TextStyle(
              fontSize: 28, // Tamaño de la fuente
              fontWeight: FontWeight.bold, // Peso de la fuente
              color: Colors.black, // Color de la fuente
              height: 1.2, // Altura de la fuente
            ),
          ),
          const SizedBox(height: 15), // Espaciado interno
          const Text(
            _welcomeSubtitle, // Subtitulo de la bienvenida
            style: TextStyle(
              fontSize: 14, // Tamaño de la fuente
              color: Colors.black87, // Color de la fuente
              height: 1.4, // Altura de la fuente
            ),
            textAlign: TextAlign.center, // Alineacion del contenido
          ),
          const SizedBox(height: 30), // Espaciado interno
          _buildFeatureIcons(), // Fila de iconos de características
        ],
      ),
    );
  }

  /// Construye la fila de iconos de características.
  Widget _buildFeatureIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Alineacion del contenido
      children: [
        _buildFeatureIcon(
          icon: Icons.person, // Icono de la característica
          color: Colors.blue, // Color de la característica
        ),
        _buildFeatureIcon(
          icon: Icons.favorite, // Icono de la característica
          color: Colors.green, // Color de la característica
        ),
        _buildFeatureIcon(
          icon: Icons.star, // Icono de la característica
          color: Colors.orange, // Color de la característica
        ),
      ],
    );
  }

  /// Construye un icono de característica individual.
  Widget _buildFeatureIcon({
    required IconData icon, // Icono de la característica
    required Color color, // Color de la característica
  }) {
    return Container(
      padding: const EdgeInsets.all(10), // Espaciado interno
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1), // Color de la tarjeta
        borderRadius: BorderRadius.circular(_featureBoxSize), // Radio de la tarjeta
      ),
      child: Icon(
        icon, // Icono de la característica
        color: color,
        size: _featureIconSize,
      ),
    );
  }

  /// Construye un botón personalizado.
  Widget _buildButton({
    required BuildContext context, // Contexto de la pantalla
    required VoidCallback onPressed, // Accion del botón
    required IconData icon, // Icono del botón
    required String label, // Etiqueta del botón
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * _buttonWidthFactor,
      child: ElevatedButton(
        onPressed: onPressed, // Accion del botón
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // Color del botón
          padding: const EdgeInsets.symmetric(vertical: 15), // Espaciado interno
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_buttonBorderRadius), // Radio de la tarjeta
          ),
          elevation: _buttonElevation, // Elevacion del botón
          shadowColor: Colors.blue.withValues(alpha: 0.3), // Color de la sombra
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon, // Icono del botón
              color: Colors.white, // Color del icono
              size: _buttonIconSize, // Tamaño del icono
            ),
            const SizedBox(width: 10), // Espaciado interno
            Text(
              label, // Etiqueta del botón
              style: const TextStyle(
                fontSize: _buttonTextSize, // Tamaño del texto
                fontWeight: FontWeight.bold, // Peso del texto
                color: Colors.white, // Color del texto
              ),
            ),
          ],
        ),
      ),
    );
  }
}