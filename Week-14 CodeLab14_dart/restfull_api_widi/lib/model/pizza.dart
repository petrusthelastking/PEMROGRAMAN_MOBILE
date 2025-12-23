const String keyId = 'id';
const String keyName = 'pizzaName';
const String keyDescription = 'description';
const String keyPrice = 'price';
const String keyImage = 'imageUrl';
const String keyCategory = 'category'; // 1. Key Baru untuk Kategori

class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;
  final String category; // 2. Field Baru untuk Kategori

  Pizza({
    required this.id,
    required this.pizzaName,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category, // 3. Wajib diisi
  });

  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
      id: int.tryParse(json[keyId].toString()) ?? 0,
      pizzaName: json[keyName] != null ? json[keyName].toString() : 'No name',
      description: json[keyDescription] != null
          ? json[keyDescription].toString()
          : '',
      price: double.tryParse(json[keyPrice].toString()) ?? 0.0,
      imageUrl: json[keyImage] != null ? json[keyImage].toString() : '',
      // 4. Ambil kategori dari JSON, default 'Main Course' kalau kosong
      category: json[keyCategory] != null
          ? json[keyCategory].toString()
          : 'Main Course',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      keyId: id,
      keyName: pizzaName,
      keyDescription: description,
      keyPrice: price,
      keyImage: imageUrl,
      keyCategory: category, // 5. Kirim kategori ke server
    };
  }
}
