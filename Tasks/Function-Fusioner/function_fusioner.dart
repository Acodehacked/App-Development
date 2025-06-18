import 'dart:math';

void processList(List<int> numbers, int Function(int) operation) {
  for (var n in numbers) {
    print('$n => ${operation(n)}');
  }
}

void main() {
  List<int> numbers1 = [1, 2, 3, 4, 5];
  List<int> numbers2 = [10, 20, 30, 40, 50];

  print('Square of the numbers in the list of numbers');
  processList(numbers2, (int num) => pow(num, 2).toInt());

  print(
    'Custom operation (n(n+1) + n²) for the numbers in the list of numbers',
  );
  processList(numbers1, (int num) => num * (num + 1) + pow(num, 2).toInt());

  print('Sum of squares till n in the list of the numbers');
  processList(numbers2, (int num) => (num * (num + 1) * (2 * num + 1)) ~/ 6);

  print('Sum cubes till n in the list of numbers');
  processList(numbers1, (int num) => pow((num * (num + 1) ~/ 2), 2).toInt());
}
