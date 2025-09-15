// sebelum perbaiki
// var list = [1, 2, 3];
// var list2 = [0, ...list];
// print(list1);
// print(list2);
// print(list2.length);

// Sesuah perbaiki
void main() {
  var list1 = [1, 2, 3];
  var list2 = [0, ...list1];

  print(list1);        // [1, 2, 3]
  print(list2);        // [0, 1, 2, 3]
  print(list2.length); // 4
}
