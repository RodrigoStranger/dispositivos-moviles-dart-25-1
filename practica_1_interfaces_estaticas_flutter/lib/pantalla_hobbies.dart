import 'package:flutter/material.dart';

// Clase que representa una tarjeta de hobby
class HobbyCard extends StatelessWidget {
  final String title; // Titulo del hobby
  final String description; // Descripcion del hobby
  final String imageUrl; // URL de la imagen del hobby
  final IconData icon; // Icono del hobby
  final Color color; // Color del hobby
  final Color iconColor; // Color del icono del hobby

  // Constructor de la clase HobbyCard
  const HobbyCard({
    super.key, // Clave del widget
    required this.title, // Titulo del hobby
    required this.description, // Descripcion del hobby
    required this.imageUrl, // URL de la imagen del hobby
    required this.icon, // Icono del hobby
    required this.color, // Color del hobby
    required this.iconColor, // Color del icono del hobby
  });

  // Metodo que construye la tarjeta de hobby
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20), // Margen inferior.
      padding: const EdgeInsets.all(20), // Espaciado interno.
      decoration: BoxDecoration(
        color: Colors.white.withAlpha((0.95 * 255).round()), // Color de la tarjeta.
        borderRadius: BorderRadius.circular(15), // Radio de la tarjeta.
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.1 * 255).round()), // Color de la sombra.
            blurRadius: 8, // Radio de la sombra.
            offset: const Offset(0, 3), // Offset de la sombra.
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 80, // Ancho de la tarjeta.
            height: 80, // Alto de la tarjeta.
            decoration: BoxDecoration(
              color: color.withAlpha((0.2 * 255).round()), // Color del icono y del fondo.
              borderRadius: BorderRadius.circular(15), // Radio de la tarjeta.
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15), // Radio de la tarjeta.
              child: Image.network(
                imageUrl, // URL de la imagen del hobby.
                fit: BoxFit.cover, // Formato de la imagen.
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    icon, // Icono del hobby.
                    size: 40, // Tamaño del icono.
                    color: iconColor, // Color del icono.
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18, // Tamaño de la fuente.
                    fontWeight: FontWeight.bold, // Peso de la fuente.
                    color: color, // Color de la fuente.
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14, // Tamaño de la fuente.
                    color: Colors.black87, // Color de la fuente.
                    height: 1.3, // Altura de la fuente.
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Pantalla que muestra los hobbies e intereses del usuario.
class PantallaHobbies extends StatelessWidget {
  const PantallaHobbies({super.key}); // Clave del widget.

  // Constantes para la tarjeta de bienvenida
  static const _appBarTitle = 'Mis Hobbies'; // Titulo de la barra de aplicacion
  static const _cardTitle = 'Mis Pasiones e Intereses'; // Titulo de la tarjeta
  static const _cardSubtitle = 'Estas son las actividades que más disfruto en mi tiempo libre'; // Subtitulo de la tarjeta
  
  // Constantes de estilo
  static const _titleStyle = TextStyle(
    fontSize: 22, // Tamaño de la fuente
    fontWeight: FontWeight.bold, // Peso de la fuente
    color: Colors.white, // Color de la fuente
  );
  static const _cardTitleStyle = TextStyle(
    fontSize: 24, // Tamaño de la fuente
    fontWeight: FontWeight.bold, // Peso de la fuente
    color: Colors.black, // Color de la fuente
  );
  static const _cardSubtitleStyle = TextStyle(
    fontSize: 14, // Tamaño de la fuente
    color: Colors.black87, // Color de la fuente
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(), // Barra de aplicacion
      body: _buildBody(), // Cuerpo de la pantalla
    );
  }

  /// Construye la barra de aplicacion.
  PreferredSizeWidget _buildAppBar() {
    return AppBar( 
      title: const Text(_appBarTitle, style: _titleStyle), // Titulo de la barra de aplicacion
      backgroundColor: Colors.blue, // Color de la barra de aplicacion
      elevation: 4, // Elevacion de la barra de aplicacion
      centerTitle: true, // Centrar el titulo
    );
  }

  /// Construye el cuerpo principal de la pantalla.
  Widget _buildBody() {
    return Container(
      width: double.infinity, // Ancho de la pantalla
      height: double.infinity, // Alto de la pantalla
      color: Colors.white, // Color de la pantalla
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0), // Espaciado interno
        child: Column(
          children: [
            const SizedBox(height: 10),
            _buildWelcomeCard(), // Tarjeta de bienvenida
            const SizedBox(height: 25),
            HobbyCard(
              title: 'Programación', // Titulo del hobby
              description: 'Programar en JavaScript, Python, TypeScript', // Descripcion del hobby
              imageUrl: 'https://images.unsplash.com/photo-1461749280684-dccba630e2f6?w=200&h=200&fit=crop', // URL de la imagen del hobby
              icon: Icons.code, // Icono del hobby
              color: Colors.blue, // Color del hobby
              iconColor: Colors.blue, // Color del icono del hobby
            ),
            const SizedBox(height: 15),
            HobbyCard(
              title: 'Videojuegos', // Titulo del hobby
              description: 'League of Legends, R.E.P.O y GTA V', // Descripcion del hobby
              imageUrl: 'https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=200&h=200&fit=crop', // URL de la imagen del hobby
              icon: Icons.sports_esports, // Icono del hobby
              color: Colors.purple, // Color del hobby
              iconColor: Colors.purple, // Color del icono del hobby
            ),
            const SizedBox(height: 15),
            HobbyCard(
              title: 'Deportes', // Titulo del hobby
              description: 'Fútbol', // Descripcion del hobby
              imageUrl: 'https://images.unsplash.com/photo-1540747913346-19e32dc3e97e?w=200&h=200&fit=crop', // URL de la imagen del hobby
              icon: Icons.sports_soccer, // Icono del hobby
              color: Colors.green, // Color del hobby
              iconColor: Colors.green, // Color del icono del hobby
            ),
          ],
        ),
      ),
    );
  }

  /// Construye la tarjeta de bienvenida con título y subtítulo.
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
          Text(
            _cardTitle,
            style: _cardTitleStyle, // Estilo del texto
            textAlign: TextAlign.center, // Alineacion del contenido
          ),
          const SizedBox(height: 10),
          Text(
            _cardSubtitle, // Subtitulo de la bienvenida
            style: _cardSubtitleStyle, // Estilo del texto
            textAlign: TextAlign.center, // Alineacion del contenido
          ),
        ],
      ),
    );
  }
}