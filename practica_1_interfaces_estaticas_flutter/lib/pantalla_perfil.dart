import 'package:flutter/material.dart';

/// Pantalla que muestra el perfil del usuario con su información personal y de contacto.
class PantallaPerfil extends StatelessWidget {
  /// Crea una instancia de [PantallaPerfil].
  const PantallaPerfil({super.key}); // Clave del widget.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(), // Barra de aplicación.
      body: _buildBody(), // Cuerpo de la pantalla.
    );
  }

  // Constantes para los textos estáticos
  static const String _appBarTitle = 'Mi Perfil';
  static const String _contactSectionTitle = 'Información de contacto';
  
  /// Construye la barra de aplicación de la pantalla de perfil.
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text(
        _appBarTitle, // Titulo de la pantalla.
        style: TextStyle(
          fontSize: 22, // Tamaño de la fuente.
          fontWeight: FontWeight.bold, // Peso de la fuente.
          color: Colors.white, // Color de la fuente.
        ),
      ),
      backgroundColor: Colors.blue, // Color de la barra de aplicación.
      elevation: 4, // Elevación de la barra de aplicación.
      centerTitle: true, // Centrar el titulo.
    );
  }

  /// Construye el cuerpo principal de la pantalla.
  Widget _buildBody() {
    return Container(
      width: double.infinity, // Ancho de la pantalla.
      height: double.infinity, // Alto de la pantalla.
      color: Colors.white, // Color de la pantalla.
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0), // Espaciado interno.
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildProfileImage(), // Imagen de perfil.
            const SizedBox(height: 30),
            _buildPersonalInfoCard(), // Tarjeta de información personal.
            const SizedBox(height: 25),
            _buildContactInfoCard(), // Tarjeta de información de contacto.
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  /// Construye la imagen de perfil con efecto de sombra.
  Widget _buildProfileImage() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle, // Forma de la imagen.
        border: Border.all( 
          color: Colors.white, // Color del borde.
          width: 4, // Ancho del borde.
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipOval(
        child: Image.network(
          'https://github.com/RodrigoStranger.png', // URL de la imagen.
          width: 150, // Ancho de la imagen.
          height: 150, // Alto de la imagen.
          fit: BoxFit.cover, // Formato de la imagen.
          loadingBuilder: _buildLoadingIndicator, // Indicador de carga.
          errorBuilder: _buildErrorWidget, // Widget de error.
        ),
      ),
    );
  }

  /// Construye el indicador de carga para la imagen de perfil.
  Widget _buildLoadingIndicator(
    BuildContext context, // Contexto de la pantalla.
    Widget child, // Widget que se está cargando.
    ImageChunkEvent? loadingProgress, // Progreso de la carga.
  ) {
    if (loadingProgress == null) return child;
    
    return Container(
      width: 150, // Ancho de la imagen.
      height: 150, // Alto de la imagen.
      decoration: const BoxDecoration(
        color: Color(0xFFE0E0E0), // Colors.grey[200]
        shape: BoxShape.circle, // Forma de la imagen.
      ),
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.teal, // Color del indicador.
        ),
      ),
    );
  }

  /// Construye el widget de error para la imagen de perfil.
  Widget _buildErrorWidget(
    BuildContext context, // Contexto de la pantalla.
    Object error, // Error que ocurrió.
    StackTrace? stackTrace, // Pila de errores.
  ) {
    return Container(
      width: 150, // Ancho de la imagen.
      height: 150, // Alto de la imagen.
      decoration: const BoxDecoration(
        color: Color(0xFFB2DFDB), // Colors.teal[100]
        shape: BoxShape.circle, // Forma de la imagen.
      ),
      child: const Icon(
        Icons.person, // Icono de la imagen.
        size: 80, // Tamaño del icono.
        color: Colors.teal, // Color del icono.
      ),
    );
  }

  /// Construye la tarjeta con la información personal.
  Widget _buildPersonalInfoCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1), // Color de la sombra.
            blurRadius: 10, // Radio de la sombra.
            offset: const Offset(0, 5), // Offset de la sombra.
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildName(), // Nombre del usuario.
          const SizedBox(height: 10),
          _buildTitle(), // Titulo del usuario.
          const SizedBox(height: 20),
          _buildDescription(), // Descripcion del usuario.
        ],
      ),
    );
  }

  /// Construye el widget del nombre del usuario.
  Widget _buildName() {
    return const Text(
      'Rodrigo Emerson Infanzón Acosta',
      style: TextStyle(
        fontSize: 26, // Tamaño de la fuente.
        fontWeight: FontWeight.bold, // Peso de la fuente.
        color: Colors.black, // Color de la fuente.
      ),
      textAlign: TextAlign.center, // Alineación del texto.
    );
  }

  /// Construye el widget del título profesional.
  Widget _buildTitle() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15, // Espaciado horizontal.
        vertical: 5, // Espaciado vertical.
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), // Radio de la tarjeta.
      ),
      child: const Text(
        'Estudiante de Ingeniería de Software',
        style: TextStyle(
          fontSize: 16, // Tamaño de la fuente.
          color: Colors.black, // Color de la fuente.
        ),
      ),
    );
  }

  /// Construye la descripción personal.
  Widget _buildDescription() {
    return const Text(
      'Apasionado desarrollador backend enfocado en crear soluciones eficientes y escalables.',
      style: TextStyle(
        fontSize: 16, // Tamaño de la fuente.
        color: Colors.black87, // Color de la fuente.
        height: 1.5, // Altura de la fuente.
      ),
      textAlign: TextAlign.center, // Alineación del texto.
    );
  }

  /// Construye la tarjeta con la información de contacto.
  Widget _buildContactInfoCard() {
    return Container(
      width: double.infinity, // Ancho de la tarjeta.
      padding: const EdgeInsets.all(20), // Espaciado interno.
      decoration: BoxDecoration(
        color: Colors.white, // Color de la tarjeta.
        borderRadius: BorderRadius.circular(20), // Radio de la tarjeta.
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1), // Color de la sombra.
            blurRadius: 10, // Radio de la sombra.
            offset: const Offset(0, 5), // Offset de la sombra.
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildContactHeader(), // Encabezado de la sección de contacto.
          const SizedBox(height: 20), // Espaciado interno.
          _buildContactItems(), // Lista de elementos de contacto.
        ],
      ),
    );
  }

  /// Construye el encabezado de la sección de contacto.
  Widget _buildContactHeader() {
    return Center(
      child: Text(
        _contactSectionTitle, // Texto del encabezado.
        style: const TextStyle(
          fontSize: 20, // Tamaño de la fuente.
          fontWeight: FontWeight.bold, // Peso de la fuente.
          color: Colors.black, // Color de la fuente.
        ),
      ),
    );
  }

  /// Construye la lista de elementos de contacto.
  Widget _buildContactItems() {
    return const Column(
      children: [
        _ContactInfoItem(
          icon: Icons.email, // Icono del elemento.
          color: Colors.red, // Color del icono y del fondo.
          text: 'rinfanzona@ulasalle.edu.pe', // Texto del elemento.
        ),
        SizedBox(height: 15), // Espaciado interno.
        _ContactInfoItem(
          icon: Icons.phone, // Icono del elemento.
          color: Colors.green, // Color del icono y del fondo.
          text: '+51 948 899 033', // Texto del elemento.
        ),
        SizedBox(height: 15), // Espaciado interno.
        _ContactInfoItem(
          icon: Icons.location_on, // Icono del elemento.
          color: Colors.blue, // Color del icono y del fondo.
          text: 'Perú, Arequipa, Characato', // Texto del elemento.
        ),
      ],
    );
  }
}

/// Widget que muestra un elemento de información de contacto.
class _ContactInfoItem extends StatelessWidget {
  /// Crea una instancia de [_ContactInfoItem].
  const _ContactInfoItem({
    required this.icon, // Icono a mostrar.
    required this.color, // Color del icono y del fondo.
    required this.text, // Texto a mostrar.
  });

  /// Icono a mostrar.
  final IconData icon;

  /// Color del icono y del fondo.
  final Color color;

  /// Texto a mostrar.
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Icono con fondo
        Container(
          padding: const EdgeInsets.all(10), // Espaciado interno.
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1), // Color del icono y del fondo.
            borderRadius: BorderRadius.circular(10), // Radio de la tarjeta.
          ),
          child: Icon(icon, color: color, size: 24), // Icono del elemento.
        ),
        
        // Espaciado
        const SizedBox(width: 15),
        
        // Texto
        Expanded(
          child: Text(
            text, // Texto del elemento.
            style: const TextStyle(
              fontSize: 16, // Tamaño de la fuente.
              color: Colors.black87, // Color de la fuente.
            ),
          ),
        ),
      ],
    );
  }
}