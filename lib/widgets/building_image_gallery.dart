// lib/widgets/building_image_gallery.dart

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as cs; // <-- CON EL PREFIJO
import '../screens/image_viewer_screen.dart';

class BuildingImageGallery extends StatelessWidget {
  final List<String>? imageUrls;
  final Function(int) onImageTap;

  const BuildingImageGallery({
    Key? key,
    required this.imageUrls,
    required this.onImageTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrls == null || imageUrls!.isEmpty) {
      return const SizedBox.shrink();
    }

    final List<String> displayImages = imageUrls!;

    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),

      child: cs.CarouselSlider.builder( // <-- USANDO EL PREFIJO
        itemCount: displayImages.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageViewerScreen(
                    imageUrls: displayImages,
                    initialIndex: itemIndex,
                    isAsset: true,
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                displayImages[itemIndex],
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[300],
                  child: Icon(Icons.broken_image, color: Colors.grey[600]),
                ),
              ),
            ),
          );
        },
        options: cs.CarouselOptions( // <-- USANDO EL PREFIJO
          height: 200,
          viewportFraction: 0.8,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          initialPage: 0,
          autoPlay: false,
        ),
      ),
    );
  }
}