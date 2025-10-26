import 'dart:io';
import 'package:flutter/material.dart';

// Widget untuk menampilkan gambar yang diambil.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture - NIM Anda')),
      // Gambar disimpan sebagai file di perangkat.
      // Gunakan constructor `Image.file` dengan path yang diberikan.
      body: Image.file(File(imagePath)),
    );
  }
}