// sebelum diperbaiki
// (int, int) tukar((int, int) record) {
//   var (a, b) = record;
//   return (b, a);
// }


// sesudah dipebaiki
// Di luar main():
(int, int) tukar((int, int) record) {
  var (a, b) = record; // destructuring
  return (b, a);       // tukar posisi
}

void main() {
  (int, int) r = (3, 7);
  print('sebelum : $r');         // (3, 7)

  final swapped = tukar(r);
  print('sesudah : $swapped');   // (7, 3)

  // contoh akses hasil
  var (x, y) = swapped;
  print('x=$x, y=$y');           // x=7, y=3
}


