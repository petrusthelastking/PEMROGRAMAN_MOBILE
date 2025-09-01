void main() {
  // Non-nullable (tidak boleh null)
  String name = 'Petrus';
  // name = null;            // ❌ compile error

  // Nullable (boleh null)
  String? nickname;
  print('Nickname awal: ${nickname?.toUpperCase() ?? "(tidak ada)"}');

  // Setelah diisi, aman dipakai
  nickname = 'tyang';
  print('Nickname setelah diisi: ${nickname!.toUpperCase()}'); // '!' = yakin tidak null
}
