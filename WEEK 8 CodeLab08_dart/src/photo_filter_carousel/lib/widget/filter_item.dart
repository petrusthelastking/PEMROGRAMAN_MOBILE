import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class FilterItem extends StatelessWidget {
  const FilterItem({
    super.key,
    required this.color,
    this.onFilterSelected,
  });

  final Color color;
  final VoidCallback? onFilterSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFilterSelected,
      child: const AspectRatio(
        aspectRatio: 1.0,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: _PreviewCircle(),
        ),
      ),
    );
  }
}

class _PreviewCircle extends StatelessWidget {
  const _PreviewCircle();

  @override
  Widget build(BuildContext context) {
    // Gunakan InheritedTheme/Theme untuk ambil warna dari parent GestureDetector
    // supaya color bisa di-override via IconTheme.merge jika perlu.
    final parent = context.findAncestorWidgetOfExactType<FilterItem>();
    final color = parent?.color ?? Colors.white;

    return ClipOval(
      child: Image.network(
        'https://docs.flutter.dev/cookbook/img-files'
            '/effects/instagram-buttons/millennial-texture.jpg',
        color: color.withOpacity(0.5),
        colorBlendMode: BlendMode.hardLight,
        fit: BoxFit.cover,
      ),
    );
  }
}
