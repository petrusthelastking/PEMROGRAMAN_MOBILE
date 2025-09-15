// Code Awal:
// var names1 = <String>{};
// Set<String> names2 = {}; // This works, too.
// var names3 = {}; // Creates a map, not a set.
//
// print(names1);
// print(names2);
// print(names3);

// Code Perbaikan
void main() {
  // Dua Set kosong
  final Set<String> names1 = <String>{};
  final Set<String> names2 = <String>{};

  // Tambah pakai .add()
  names1.add('Petrus Tyang A.R');
  names1.add('2341720227');

  // Tambah pakai .addAll()
  names2.addAll(['Petrus Tyang A.R', '2341720227']);

  // Dokumentasi hasil (console)
  print('names1: $names1'); // {Petrus Tyang A.R, 2341720227}
  print('names2: $names2'); // {Petrus Tyang A.R, 2341720227}
}


