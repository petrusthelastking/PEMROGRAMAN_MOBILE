void main() {
  // Langkah 1 — izinkan nilai campuran (String / int) dulu
  final Map<String, Object> gifts = {
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1, // masih int di awal
  };

  final Map<int, Object> nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 2, // masih int di awal
  };

  print('=== Langkah 1 ===');
  print('gifts: $gifts');
  print('nobleGases: $nobleGases');

  // Langkah 3 — map baru
  final mhs1 = <String, String>{};
  final mhs2 = <int, String>{};

  // Normalkan gifts -> semua String
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  // Normalkan nobleGases -> semua String
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  // Tambah nama & NIM ke SEMUA map
  gifts['name'] = 'Petrus Tyang A.R';
  gifts['nim']  = '2341720227';

  nobleGases[99]  = 'Petrus Tyang A.R';
  nobleGases[100] = '2341720227';

  mhs1['name'] = 'Petrus Tyang A.R';
  mhs1['nim']  = '2341720227';

  mhs2[1] = 'Petrus Tyang A.R';
  mhs2[2] = '2341720227';

  print('\n=== Setelah Langkah 3 ===');
  print('gifts: $gifts');         // semua value sudah String
  print('nobleGases: $nobleGases'); // semua value sudah String
  print('mhs1: $mhs1');
  print('mhs2: $mhs2');
}
