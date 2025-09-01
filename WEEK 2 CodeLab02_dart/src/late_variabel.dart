void main() {
  late String token;     // non-nullable, tapi diisi nanti

  // print(token);        // ❌ runtime error: LateInitializationError (jika tidak diisi dulu)

  token = 'abc123';
  print('Token: $token'); // ✅ aman karena sudah diinisialisasi sebelum dipakai
}
