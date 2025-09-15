// sebelum di perbaiki
// var record = ('first', a: 2, b: true, 'last');
// print(record)

// sesudah di perbaiki
void main() {
  var record = ('first', a: 2, b: true, 'last');

  // cetak seluruh record
  print(record); // ('first', a: 2, b: true, 'last');

  // akses elemen positional & named
  print(record.$1); // first
  print(record.$2); // last
  print(record.a);  // 2
  print(record.b);  // true
}