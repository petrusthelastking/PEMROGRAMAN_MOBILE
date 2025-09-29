import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ===== titleSection =====
    final Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            // Kolom kiri: judul + lokasi
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Judul (bold) dengan padding bawah 8
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Wisata Gunung di Batu',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                // Subjudul abu-abu
                Text(
                  'Batu, Malang, Indonesia',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          // Ikon bintang merah + angka rating
          Icon(Icons.star, color: Colors.red[500]),
          const SizedBox(width: 8),
          const Text('41'),
        ],
      ),
    );

    // ===== buttonSection (3 kolom ikon di atas teks) =====
    final Color color = Theme.of(context).colorScheme.primary;
    final Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    // ===== textSection =====
    final Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Carilah teks di internet yang sesuai '
            'dengan foto atau tempat wisata yang ingin '
            'Anda tampilkan. '
            'Tambahkan nama dan NIM Anda sebagai '
            'identitas hasil pekerjaan Anda. '
            'Selamat mengerjakan 🙂.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter layout demo',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter layout demo')),
        // ListView: aman overflow & bisa scroll
        body: ListView(
          children: [
            // Gambar header dari aset
            Image.asset(
              'assets/images/lake.png',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  // ===== Helper: kolom tombol (ikon di atas teks) =====
  static Column _buildButtonColumn(Color color, IconData icon, String label) {
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
