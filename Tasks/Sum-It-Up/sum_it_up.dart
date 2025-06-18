import 'dart:io';

/// Entry point of the program.
/// Prompts the user to input two space-separated integers,
/// calculates their sum, and displays the result.
void main() {
  // Prompt the user to enter two numbers separated by space
  stdout.write("Enter 2 numbers: ");
  var input = stdin.readLineSync()?.split(' '); // Read input and split by space

  // Check if valid input was provided
  if (input == null || input.length < 2) return;

  try {
    // Parse the input strings into integers
    var a = int.parse(input[0]);
    var b = int.parse(input[1]);

    // Calculate and display the sum of the two numbers
    print("Sum of $a and $b is: ${a + b}");
  } catch (e) {
    // Handle invalid input or parsing errors
    print("Invalid input.");
  }
}
