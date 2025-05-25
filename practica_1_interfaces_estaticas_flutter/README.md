# Práctica 1: Interfaces Estáticas en Flutter

## 🚀 Descripción
Este proyecto muestra tres interfaces estáticas que demuestran habilidades en el desarrollo de interfaces de usuario móviles. Cada pantalla está diseñada siguiendo las mejores prácticas de Flutter y Material Design.

## 🎨 Pantallas

### 1. 🏠 Pantalla de Inicio
- Mensaje de bienvenida personalizado
- Navegación intuitiva
- Diseño limpio y moderno

### 2. 👤 Perfil de Usuario
- Foto de perfil con efecto de sombra
- Información personal detallada
- Sección de contacto con iconos

### 3. ⚽ Hobbies e Intereses
- Tarjetas interactivas
- Imágenes de alta calidad
- Diseño responsivo

## 🛠️ Arquitectura

### 📦 Estructura de Archivos
```
lib/
├── main.dart                 # Configuración inicial de la app
├── pantalla_inicio.dart      # Contiene la clase PantallaInicio
├── pantalla_perfil.dart      # Contiene la clase PantallaPerfil
└── pantalla_hobbies.dart     # Contiene la clase PantallaHobbies
```

### 🧩 Componentes Principales
- **Widgets Personalizados**
  - `HobbyCard`: Muestra información de hobbies
  - `_ContactInfoItem`: Muestra información de contacto

## 🎯 Características Técnicas

### 🏗️ Estructura del Código

#### 1. **Widgets Estatales con StatelessWidget**
```dart
class PantallaPerfil extends StatelessWidget {
  const PantallaPerfil({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
  
  // Más métodos privados...
}
```

#### 2. **Constantes para Textos**
```dart
static const String _appBarTitle = 'Mi Perfil';
static const String _contactSectionTitle = 'Información de contacto';
```

#### 3. **Métodos Privados para Componentes**
```dart
Widget _buildContactInfoCard() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(25),
    child: Column(
      children: [
        const Text(_contactSectionTitle),
        // Más widgets...
      ],
    ),
  );
}
```

### 🎨 Buenas Prácticas de Diseño

#### 1. **Widgets Reutilizables**
```dart
class HobbyCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final IconData icon;
  final Color color;
  final Color iconColor;

  const HobbyCard({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.icon,
    required this.color,
    required this.iconColor,
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return Card(
      // Implementación del widget
    );
  }
}
```

#### 2. **Manejo de Imágenes con Loading y Error**
```dart
Image.network(
  'https://ejemplo.com/imagen.jpg',
  loadingBuilder: (context, child, loadingProgress) {
    if (loadingProgress == null) return child;
    return const CircularProgressIndicator();
  },
  errorBuilder: (context, error, stackTrace) => 
    const Icon(Icons.error),
);
```

### 🚀 Optimizaciones

#### 1. **Constantes para Estilos**
```dart
static const TextStyle _titleStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Colors.black87,
);
```

#### 2. **Widgets de Espaciado**
```dart
Column(
  children: [
    _buildHeader(),
    const SizedBox(height: 20), // Espaciado consistente
    _buildContent(),
    const SizedBox(height: 20),
    _buildFooter(),
  ],
)
```

#### 3. **Documentación de Métodos**
```dart
/// Construye la tarjeta de información de contacto con estilos predefinidos.
/// 
/// Retorna un [Widget] que muestra la sección de contacto con un título
/// y una lista de elementos de contacto.
Widget _buildContactInfoCard() {
  // Implementación...
}