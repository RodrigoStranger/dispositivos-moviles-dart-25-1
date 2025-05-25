import 'package:flutter/material.dart';

/// Pantalla principal de la aplicación que muestra una bienvenida y opciones de navegación.
class PantallaInicio extends StatelessWidget {
  /// Crea una instancia de [PantallaInicio].
  const PantallaInicio({super.key});

  static const _appBarTitle = 'Bienvenido';
  static const _welcomeTitle = '¡Bienvenido a mi aplicación personal!';
  static const _welcomeSubtitle = 
      'Aquí podrás conocer más sobre mí, mis intereses y mis proyectos';
  static const _buttonWidthFactor = 0.6;
  static const _buttonBorderRadius = 30.0;
  static const _buttonElevation = 5.0;
  static const _buttonIconSize = 24.0;
  static const _buttonTextSize = 18.0;
  static const _featureIconSize = 30.0;
  static const _featureBoxSize = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  /// Construye la barra de aplicación.
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text(
        _appBarTitle,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.blue,
      elevation: 4,
      centerTitle: true,
    );
  }

  /// Construye el cuerpo principal de la pantalla.
  Widget _buildBody(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildWelcomeCard(),
                const SizedBox(height: 40),
                _buildButton(
                  context: context,
                  onPressed: () {},
                  icon: Icons.person_outline,
                  label: 'Ver mi perfil',
                ),
                const SizedBox(height: 20),
                _buildButton(
                  context: context,
                  onPressed: () {},
                  icon: Icons.favorite_outline,
                  label: 'Ver Hobbies',
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
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            _welcomeTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            _welcomeSubtitle,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          _buildFeatureIcons(),
        ],
      ),
    );
  }

  /// Construye la fila de iconos de características.
  Widget _buildFeatureIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildFeatureIcon(
          icon: Icons.person,
          color: Colors.blue,
        ),
        _buildFeatureIcon(
          icon: Icons.favorite,
          color: Colors.green,
        ),
        _buildFeatureIcon(
          icon: Icons.star,
          color: Colors.orange,
        ),
      ],
    );
  }

  /// Construye un icono de característica individual.
  Widget _buildFeatureIcon({
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(_featureBoxSize),
      ),
      child: Icon(
        icon,
        color: color,
        size: _featureIconSize,
      ),
    );
  }

  /// Construye un botón personalizado.
  Widget _buildButton({
    required BuildContext context,
    required VoidCallback onPressed,
    required IconData icon,
    required String label,
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * _buttonWidthFactor,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_buttonBorderRadius),
          ),
          elevation: _buttonElevation,
          shadowColor: Colors.blue.withOpacity(0.3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: _buttonIconSize,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: _buttonTextSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}