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

// Clase que representa la pantalla de hobbies
class PantallaHobbies extends StatelessWidget {
  const PantallaHobbies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mis Hobbies', // Titulo de la pantalla.
          style: TextStyle(
            fontSize: 22, // Tamaño de la fuente.
            fontWeight: FontWeight.bold, // Peso de la fuente.
            color: Colors.white, // Color de la fuente.
          ),
        ),
        backgroundColor: Colors.blue, // Color de la barra de aplicación.
        elevation: 4, // Elevación de la barra de aplicación.
        centerTitle: true, // Centrar el titulo.
      ),
      body: Container(
        width: double.infinity, // Ancho de la pantalla.
        height: double.infinity, // Alto de la pantalla.
        decoration: const BoxDecoration(
          color: Colors.white, // Color de la pantalla.
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0), // Espaciado interno.
          child: Column(
            children: [
              const SizedBox(height: 10), // Espaciado interno.
              Container(
                padding: const EdgeInsets.all(20), // Espaciado interno.
                decoration: BoxDecoration( // Decoración de la tarjeta.
                  color: Colors.white.withAlpha((0.9 * 255).round()), // Color de la tarjeta.
                  borderRadius: BorderRadius.circular(20), // Radio de la tarjeta.
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha((0.1 * 255).round()), // Color de la sombra.
                      blurRadius: 10, // Radio de la sombra.
                      offset: const Offset(0, 5), // Offset de la sombra.
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    Text(
                      'Mis Pasiones e Intereses', // Titulo de la pantalla.
                      style: TextStyle(
                        fontSize: 24, // Tamaño de la fuente.
                        fontWeight: FontWeight.bold, // Peso de la fuente.
                        color: Colors.black, // Color de la fuente.
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Estas son las actividades que más disfruto en mi tiempo libre',
                      style: TextStyle(
                        fontSize: 14, // Tamaño de la fuente.
                        color: Colors.black, // Color de la fuente.
                      ),
                      textAlign: TextAlign.center, // Alineación del texto.
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25), // Espacio entre el contenedor y las tarjetas

              HobbyCard(
                title: 'Programación', // Titulo del hobby.
                description: 'Programar en JavaScript, Python, TypeScript', // Descripcion del hobby.
                imageUrl: 'https://images.unsplash.com/photo-1461749280684-dccba630e2f6?w=200&h=200&fit=crop', // URL de la imagen del hobby.
                icon: Icons.code, // Icono del hobby.
                color: Colors.blue, // Color del icono.
                iconColor: Colors.blue, // Color del icono.
              ),

              HobbyCard(
                title: 'Videojuegos', // Titulo del hobby.
                description: 'League of Legends, R.E.P.O y GTA V', // Descripcion del hobby.
                imageUrl: 'https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=200&h=200&fit=crop', // URL de la imagen del hobby.
                icon: Icons.sports_esports, // Icono del hobby.
                color: Colors.purple, // Color del icono.
                iconColor: Colors.purple, // Color del icono.
              ),

              HobbyCard(
                title: 'Deportes', // Titulo del hobby.
                description: 'Fútbol', // Descripcion del hobby.
                imageUrl: 'https://images.unsplash.com/photo-1540747913346-19e32dc3e97e?w=200&h=200&fit=crop', // URL de la imagen del hobby.
                icon: Icons.sports_soccer, // Icono del hobby.
                color: Colors.green, // Color del icono.
                iconColor: Colors.green, // Color del icono.
              ),
            ],
          ),
        ),
      ),
    );
  }
}