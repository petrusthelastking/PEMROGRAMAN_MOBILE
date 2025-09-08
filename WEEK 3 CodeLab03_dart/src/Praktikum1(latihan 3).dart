void main() {
  String test = "true"; // nilai string

  // Normalisasi dulu biar aman terhadap huruf besar/kecil & spasi
  final v = test.trim().toLowerCase();

  if (v == "true") {
    print("Kebenaran");
  } else if (v == "false") {
    print("Bukan kebenaran");
  } else {
    print("Input harus 'true' atau 'false'");
  }
}
