void main() {
  // Versi eksplisit (lebih jelas tipenya)
  final Set<String> halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens); // {fluorine, chlorine, bromine, iodine, astatine}

  // Contoh operasi umum:
  print(halogens.contains('iodine')); // true
  halogens.add('fluorine'); // duplikat: set tetap sama
  halogens.remove('bromine');
  print(halogens);
}
