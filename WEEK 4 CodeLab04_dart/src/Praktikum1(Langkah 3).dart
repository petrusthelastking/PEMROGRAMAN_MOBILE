void main() {
  // List final panjang 5, semua elemen awalnya null
  final List<String?> list = List<String?>.filled(5, null, growable: false);

  // Isi nama (index 1) dan NIM (index 2)
  list[1] = 'Petrus Tyang A.R';
  list[2] = '2341720227';

  // Validasi (opsional saat dev)
  assert(list.length == 5);
  assert(list[1] == 'Petrus Tyang A.R');
  assert(list[2] == '2341720227');
  assert(list[0] == null && list[3] == null && list[4] == null);

  // Tampilkan hasil
  print('length: ${list.length}');
  for (var i = 0; i < list.length; i++) {
    print('index[$i]: ${list[i]}');
  }
}
