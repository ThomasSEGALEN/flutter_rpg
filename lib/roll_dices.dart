import 'dart:math';

int rollDices() {
  Random random = Random();
  int firstThrow = random.nextInt(6) + 1;
  int secondThrow = random.nextInt(6) + 1;
  int result = firstThrow + secondThrow;

  return result;
}
