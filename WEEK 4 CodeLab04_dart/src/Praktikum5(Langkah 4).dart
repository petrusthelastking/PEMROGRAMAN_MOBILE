//sebelum di perbaiki
// Record type annotation in a variable declaration:
// (String, int) mahasiswa;
// print(mahasiswa);

// sesudah diperbaiki
void main() {
  // Record positional: (String, int)
  (String, int) mahasiswa = ('Petrus Tyang A.R', 2341720227);

  // Cetak seluruh record
  print(mahasiswa);           // ('Petrus Tyang A.R', 2341720227)

  // Akses elemen positional
  print(mahasiswa.$1);        // Petrus Tyang A.R
  print(mahasiswa.$2);        // 2341720227

  // Destructuring (pattern)
  var (nama, nim) = mahasiswa;
  print('nama=$nama, nim=$nim'); // nama=Petrus Tyang A.R, nim=2341720227
}

