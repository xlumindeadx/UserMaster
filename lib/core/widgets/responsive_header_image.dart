import 'package:flutter/material.dart';

/// Imagen superior que ajusta su alto según el ancho disponible
/// (se ve bien en teléfono y en computador).
class ResponsiveHeaderImage extends StatelessWidget {
  final String assetPath;
  final double aspectRatio; // alto = ancho * aspectRatio
  final double minHeight;
  final double maxHeight;
  final BorderRadius borderRadius;

  const ResponsiveHeaderImage({
    super.key,
    required this.assetPath,
    this.aspectRatio = 0.6,
    this.minHeight = 140,
    this.maxHeight = 280,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height =
            (constraints.maxWidth * aspectRatio).clamp(minHeight, maxHeight);

        return ClipRRect(
          borderRadius: borderRadius,
          child: Image.asset(
            assetPath,
            width: double.infinity,
            height: height,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
