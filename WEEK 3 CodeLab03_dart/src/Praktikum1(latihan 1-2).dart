void main() {
  // List final dengan panjang 5, semua elemen awalnya null
  final List<String?> list = List<String?>.filled(5, null, growable: false);

  // Isi data
  list[1] = 'Petrus Tyang A.R';
  list[2] = '2341720227';

  // Tampilkan hasil
  print('length: ${list.length}');
  print('index[1]: ${list[1]}');
  print('index[2]: ${list[2]}');
  print('full list: $list'); // [null, Petrus Tyang A.R, 2341720227, null, null]
}
