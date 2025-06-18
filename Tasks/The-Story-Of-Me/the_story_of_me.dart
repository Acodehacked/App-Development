import 'dart:io';


void main() {
  // Prompt user for their name
  stdout.write("Enter your name: ");
  String? name = stdin.readLineSync();

  // Prompt user for their phone number
  stdout.write("Enter your phone number: ");
  String? ph = stdin.readLineSync();

  // Prompt user for their age and safely parse it as an integer
  stdout.write("Enter your Age: ");
  int? age = int.tryParse(stdin.readLineSync()!);

  // Prompt user for their height (in cm) and parse it as a double
  stdout.write("Enter your height in cm: ");
  double? height = double.tryParse(stdin.readLineSync()!);

  // Prompt user for their weight (in kg) and parse it as a double
  stdout.write("Enter your weight in kg: ");
  double? weight = double.tryParse(stdin.readLineSync()!);

  // Prompt user for their address
  stdout.write("Enter your Address: ");
  String? address = stdin.readLineSync();

  // Prompt user for hobbies (comma-separated) and split them into a list
  stdout.write("Enter your hobbies (separated by commas): ");
  String? input = stdin.readLineSync();
  List<String> hobbies = [];

  // If the hobbies input is not null or empty, process it
  if (input != null && input.isNotEmpty) {
    hobbies = input
        .split(',')
        .map((hobby) => hobby.trim()) // Trim extra spaces
        .toList();
  }

  // Display the collected information
  print('\n--- D . E . T . A . I . L . S ---');
  print('\n\tName: $name');
  print('\tPhone Number: $ph');
  print('\tAge: $age');
  print('\tHeight: $height cm');
  print('\tWeight: $weight kg');
  print('\tAddress: $address');
  print("\tYour hobbies are:");
  for (String hobby in hobbies) {
    print("\t\t- $hobby");
  }
  print('\n----------------------------------');
}
