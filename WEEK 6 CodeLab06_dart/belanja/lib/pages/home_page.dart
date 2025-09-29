import 'package:flutter/material.dart';
import '../models/item.dart';
import '../widgets/product_card.dart';
import '../widgets/category_chip.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Item> items = [
    const Item(
        title: 'Gula Pasir 1kg',
        description:
        'Gula pasir premium dari tebu pilihan, diproses secara higienis untuk menghasilkan gula yang manis dan bersih. Cocok untuk segala kebutuhan dapur Anda, mulai dari membuat kue, minuman, hingga masakan sehari-hari.',
        imageUrl:
        'https://images.tokopedia.net/img/cache/700/VqbcmM/2021/4/29/42d65f57-4148-43e4-a112-0544520f88a9.jpg',
        stock: 150,
        rating: 4.8,
        price: 18000),
    const Item(
        title: 'Minyak Goreng 2L',
        description:
        'Minyak goreng kelapa sawit berkualitas tinggi, melalui proses pemurnian multi-tahap untuk menghasilkan minyak yang jernih dan tidak mudah menghitam. Ideal untuk menggoreng, menumis, dan berbagai keperluan memasak lainnya.',
        imageUrl:
        'https://images.tokopedia.net/img/cache/700/hDjmkQ/2023/8/22/e13f4339-7833-4a11-a83d-1a843513b860.jpg',
        stock: 80,
        rating: 4.9,
        price: 35000),
    const Item(
        title: 'Tepung Terigu 1kg',
        description:
        'Tepung terigu serbaguna yang terbuat dari gandum pilihan. Memiliki kandungan protein sedang yang cocok untuk membuat aneka roti, kue basah, martabak, dan gorengan. Hasil adonan lebih mengembang dan empuk.',
        imageUrl:
        'https://images.tokopedia.net/img/cache/700/VqbcmM/2022/9/19/23115c0e-17d4-4a25-83f0-482431b8166c.jpg',
        stock: 200,
        rating: 4.7,
        price: 12500),
    const Item(
        title: 'Kopi Kapal Api 165g',
        description:
        'Kopi bubuk instan yang terbuat dari perpaduan biji kopi Arabika dan Robusta pilihan. Diolah dengan teknologi modern untuk menghasilkan aroma yang kuat dan rasa yang mantap. Secangkir semangat untuk memulai hari Anda.',
        imageUrl:
        'https://images.tokopedia.net/img/cache/700/VqbcmM/2023/10/2/6d1b72e9-f67b-4d43-9831-2911cf2982d6.jpg',
        stock: 95,
        rating: 4.9,
        price: 15000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Toko Digital',
          style: TextStyle(
            color: Colors.teal[800],
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.teal[800]),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.teal[800]),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Jelajahi Kategori",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CategoryChip(label: 'Semua', isActive: true),
                    CategoryChip(label: 'Makanan Pokok'),
                    CategoryChip(label: 'Minuman'),
                    CategoryChip(label: 'Bumbu Dapur'),
                    CategoryChip(label: 'Snack'),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Produk Terlaris",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.70, // Sedikit diubah agar pas
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return ProductCard(item: item);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.white,
        child: const Text(
          'Nama: [Nama Anda] | NIM: [NIM Anda]',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}