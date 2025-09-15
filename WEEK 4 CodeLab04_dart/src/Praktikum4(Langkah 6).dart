// sebelum diperbaiki
// var listOfInts = [1, 2, 3];
// var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
// assert(listOfStrings[1] == '#1');
// print(listOfStrings);

// sesudah di perbaiki
void main() {
  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];

  assert(listOfStrings[1] == '#1'); // lulus
  print(listOfStrings);             // [#0, #1, #2, #3]
}
