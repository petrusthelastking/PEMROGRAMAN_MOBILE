// sebelum perbaikan
// list1 = [1, 2, null];
// print(list1);
// var list3 = [0, ...?list1];
// print(list3.length);

// sesudah di perbaiki
void main() {
  // Agar bisa menampung null di langkah 3, pakai List<int?> sejak awal
  List<int?> list1 = [1, 2, 3];
  var list2 = [0, ...list1];
  print(list1);         // [1, 2, 3]
  print(list2);         // [0, 1, 2, 3]
  print(list2.length);  // 4

  // === Langkah 3 ===
  list1 = [1, 2, null];
  print(list1); // [1, 2, null]

  // Null-aware spread: aman jika list1 == null (tidak menambah apa-apa).
  // TAPI elemen null di dalam list tetap ikut masuk.
  List<int?> list3 = [0, ...?list1];
  print(list3.length);  // 4
  print(list3);         // [0, 1, 2, null]

  // (Opsional) Kalau mau menghapus elemen null saat di-spread:
  final list3NoNull = [0, ...list1.whereType<int>()];
  print(list3NoNull);   // [0, 1, 2]

  // Tambahkan variabel list berisi NIM menggunakan Spread Operators
  final head = ['2','3','4','1','7'];
  final tail = ['2','0','2','2','7'];
  final nim = [...head, ...tail];
  print(nim);           // [2, 3, 4, 1, 7, 2, 0, 2, 2, 7]
  print(nim.join());    // 2341720227
}
