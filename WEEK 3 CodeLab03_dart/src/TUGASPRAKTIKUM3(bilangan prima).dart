import 'dart:math';

bool isPrime(int n) {
  if (n < 2) return false;
  if (n == 2) return true;
  if (n % 2 == 0) return false;
  final limit = sqrt(n).floor();
  for (int i = 3; i <= limit; i += 2) {
    if (n % i == 0) return false;
  }
  return true;
}

void main() {
  for (int n = 0; n <= 201; n++) {
    if (isPrime(n)) {
      print('$n -> Petrus Tyang A.R, NIM 2341720227');
    }
  }
}
