import 'dart:io'; // Penting untuk Image.file
import 'package:flutter/material.dart';
import 'package:kamera_filter_app/widgets/filter_selector.dart';

// Ini adalah gabungan dari DisplayPictureScreen (P1) dan PhotoFilterCarousel (P2)
class FilterScreen extends StatefulWidget {
  final String imagePath; // Diambil dari P1

  const FilterScreen({super.key, required this.imagePath});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // Logic state management diambil dari P2 (PhotoFilterCarousel)
  final _filters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
          (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    ),
  ];

  final _filterColor = ValueNotifier<Color>(Colors.white);

  void _onFilterChanged(Color value) {
    _filterColor.value = value;
  }

  // Build method diambil dari P2 (PhotoFilterCarousel)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Apply Filter - 2341720028')),
      body: Material(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
              // Panggil method _buildPhotoWithFilter
              child: _buildPhotoWithFilter(),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              // Panggil method _buildFilterSelector
              child: _buildFilterSelector(),
            ),
          ],
        ),
      ),
    );
  }

  // Method ini diambil dari P2, TAPI...
  Widget _buildPhotoWithFilter() {
    return ValueListenableBuilder(
      valueListenable: _filterColor,
      builder: (context, color, child) {
        // ...Kita GANTI Image.network() dengan Image.file() dari P1
        return Image.file(
          File(widget.imagePath), // <-- PERUBAHAN UTAMA
          color: color.withOpacity(0.5),
          colorBlendMode: BlendMode.color,
          fit: BoxFit.cover,
        );
      },
    );
  }

  // Method ini diambil dari P2
  Widget _buildFilterSelector() {
    return FilterSelector(
      onFilterChanged: _onFilterChanged,
      filters: _filters,
    );
  }
}