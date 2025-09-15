// sebelum di perbaiki
// var mahasiswa2 = ('first', a: 2, b: true, 'last');
//
// print(mahasiswa2.$1); // Prints 'first'
// print(mahasiswa2.a); // Prints 2
// print(mahasiswa2.b); // Prints true
// print(mahasiswa2.$2); // Prints 'last'

// sesudah diperbaiki
void main() {
  // Record dengan 2 positional + 2 named fields
  var mahasiswa2 = ('first', a: 2, b: true, 'last');

  // Output sebelum diganti
  print(mahasiswa2.$1); // first
  print(mahasiswa2.a);  // 2
  print(mahasiswa2.b);  // true
  print(mahasiswa2.$2); // last

  // Ganti isi record: $1 = Nama (String), a = NIM (int)
  mahasiswa2 = ('Petrus Tyang A.R', a: 2341720227, b: true, 'last');

  // Dokumentasi hasil
  print('\nSetelah diganti:');
  print(mahasiswa2);     // ('Petrus Tyang A.R', a: 2341720227, b: true, 'last')
  print(mahasiswa2.$1);  // Petrus Tyang A.R
  print(mahasiswa2.a);   // 2341720227
  print(mahasiswa2.b);   // true
  print(mahasiswa2.$2);  // last
}
