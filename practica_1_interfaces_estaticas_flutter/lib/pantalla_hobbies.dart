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
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha((0.95 * 255).round()),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.1 * 255).round()),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: color.withAlpha((0.2 * 255).round()),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    icon,
                    size: 40,
                    color: iconColor,
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
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1.3,
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
          'Mis Hobbies',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 4,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha((0.9 * 255).round()),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha((0.1 * 255).round()),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.favorite,
                      size: 40,
                      color: Colors.red,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Mis Pasiones e Intereses',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Estas son las actividades que más disfruto en mi tiempo libre',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25), // Espacio entre el contenedor y las tarjetas

              HobbyCard(
                title: 'Programación',
                description: 'Programar en JavaScript, Python, TypeScript',
                imageUrl: 'https://images.unsplash.com/photo-1461749280684-dccba630e2f6?w=200&h=200&fit=crop',
                icon: Icons.code,
                color: Colors.blue,
                iconColor: Colors.blue,
              ),

              HobbyCard(
                title: 'Videojuegos',
                description: 'League of Legends, R.E.P.O y GTA V',
                imageUrl: 'https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=200&h=200&fit=crop',
                icon: Icons.sports_esports,
                color: Colors.purple,
                iconColor: Colors.purple,
              ),

              HobbyCard(
                title: 'Deportes',
                description: 'Fútbol',
                imageUrl: 'https://images.unsplash.com/photo-1540747913346-19e32dc3e97e?w=200&h=200&fit=crop',
                icon: Icons.sports_soccer,
                color: Colors.green,
                iconColor: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}