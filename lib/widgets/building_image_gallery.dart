import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; // Importa CarouselSlider
import '../screens/image_viewer_screen.dart'; // Importa la nueva pantalla

class BuildingImageGallery extends StatelessWidget {
  final List<String>? imageUrls;
  final Function(int) onImageTap; // Esto ya no se usará directamente para el tap de zoom

  const BuildingImageGallery({
    Key? key,
    required this.imageUrls,
    required this.onImageTap, // Podríamos mantener esto para otros usos, pero el tap de zoom lo maneja aquí.
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrls == null || imageUrls!.isEmpty) {
      return const SizedBox.shrink();
    }

    // Ya no necesitas take(3), CarouselSlider maneja todas las imágenes
    final List<String> displayImages = imageUrls!;

    return Container(
      // Ya no necesitas un height fijo tan estricto aquí, CarouselSlider puede definirlo
      // o se ajustará al height de sus ítems si no tiene un height explícito.
      // Pero si quieres que la galería tenga una altura predecible, déjalo.
      height: 200, // Puedes ajustar esta altura si quieres las imágenes más grandes o pequeñas.
      // Si quieres que llene horizontalmente, quita el padding horizontal aquí
      // o hazlo más pequeño, ej: EdgeInsets.symmetric(horizontal: 8.0) o EdgeInsets.zero
      padding: const EdgeInsets.symmetric(horizontal: 16.0), // Si quieres que ocupe todo el ancho, este padding lo limita.

      child: CarouselSlider.builder(
        itemCount: displayImages.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          // El GestureDetector aquí abre la ImageViewerScreen
          return GestureDetector(
            onTap: () {
              // Navegar a la nueva pantalla de visualización de imagen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageViewerScreen(
                    imageUrls: displayImages,
                    initialIndex: itemIndex,
                    isAsset: true, // Asegúrate de que esto sea true si son assets
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              // ¡CAMBIO CLAVE AQUÍ! Usar Image.asset
              child: Image.asset(
                displayImages[itemIndex], // Usar itemIndex para la imagen actual
                fit: BoxFit.cover, // Para que la imagen rellene el espacio
                width: double.infinity, // Asegura que la imagen intente ocupar todo el ancho disponible del item
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[300],
                  child: Icon(Icons.broken_image, color: Colors.grey[600]),
                ),
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: 200, // La altura de cada item en el carrusel (debe coincidir con el Container height si lo tienes)
          viewportFraction: 0.8, // Porción de la ventana que ocupa cada ítem (para ver parcialmente otras imágenes)
          enableInfiniteScroll: false, // Desactiva el scroll infinito si no quieres repetir imágenes
          enlargeCenterPage: true, // Hace que la imagen central sea un poco más grande
          initialPage: 0,
          autoPlay: false, // Puedes ponerlo en true si quieres que se desplace automáticamente
          // aspectRatio: 16/9, // Puedes definir un aspect ratio si quieres
          // Otros ajustes como autoPlayInterval, autoPlayAnimationDuration, etc.
        ),
      ),
    );
  }
}