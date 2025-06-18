import 'dart:io';

void main() {
  stdout.write(
    'Enter the Number whose Multiplication Table is to be generated : ',
  );
  var num = int.parse(stdin.readLineSync()!);
  int sum = 0;

  print('\n The Multiplication Table of $num is : \n');
  for (int i = 1; i <= 10; i++) {
    print("\t|\t$i * $num = ${num * i}\t|  ");
    sum += num * i;
  }
  print("\nThe total Sum generated is: $sum");
}
