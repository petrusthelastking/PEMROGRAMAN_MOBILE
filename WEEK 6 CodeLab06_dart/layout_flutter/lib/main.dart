import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Section judul (dari langkah sebelumnya)
    final titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Wisata Gunung di Batu',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Batu, Malang, Indonesia',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red[500]),
          const SizedBox(width: 8),
          const Text('41'),
        ],
      ),
    );

    // Warna primer dari tema
    final primary = Theme.of(context).colorScheme.primary;

    // Section tombol 3 kolom
    final buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildButtonColumn(primary, Icons.call, 'CALL'),
        _buildButtonColumn(primary, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(primary, Icons.share, 'SHARE'),
      ],
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter layout demo')),
        body: ListView(
          children: [
            titleSection,
            const SizedBox(height: 8),
            buttonSection,
          ],
        ),
      ),
    );
  }

  // Langkah 1 — helper kolom tombol
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
