import 'dart:io';

/// Entry point of the program
/// Prompts the user to input two integers, then repeatedly offers a menu
/// for performing arithmetic or comparison operations on the two numbers.
void main() {
  // Prompt user to enter two space-separated numbers
  stdout.write('Enter the 2 numbers (space separated): ');
  var input = stdin.readLineSync()?.split(' ');

  // Validate input
  if (input == null || input.length < 2) return;

  try {
    // Parse the input strings into integers
    var a = int.parse(input[0]);
    var b = int.parse(input[1]);

    var choice;

    // Main menu loop: continues until user selects "Exit" (choice 3)
    while (choice != '3') {
      stdout.write(
        '\nEnter your choice of Operation (1->Arithmetic, 2->Comparison, 3->Exit): ',
      );
      choice = stdin.readLineSync(); // Read user's menu choice

      switch (choice) {
        case '1':
          // Arithmetic Operations Menu
          print(
            '\n\tMENU :\n\t1. Addition\n\t2. Subtraction\n\t3. Multiplication\n\t4. Division\n',
          );
          stdout.write('Enter the chosen operation: ');
          var op = stdin.readLineSync(); // Read arithmetic operation choice

          // Execute selected arithmetic operation
          switch (op) {
            case '1':
              print('Sum of $a and $b is: ${a + b}');
              break;
            case '2':
              print('Difference of $a and $b is: ${a - b}');
              break;
            case '3':
              print('Product of $a and $b is: ${a * b}');
              break;
            case '4':
              // Check for division by zero
              b != 0
                  ? print('Quotient of $a / $b is: ${a / b}')
                  : print('Error: Division by zero');
              break;
            default:
              print('Invalid operation');
          }
          break;

        case '2':
          // Perform comparison between the two numbers
          if (a > b) {
            print('Comparing $a and $b: $a is greater than $b');
          } else if (a < b) {
            print('Comparing $a and $b: $a is less than $b');
          } else {
            print('Comparing $a and $b: $a is equal to $b');
          }
          break;

        case '3':
          // Exit the program
          print('Exiting . . .');
          break;

        default:
          // Handle invalid menu selection
          print('Invalid choice');
      }
    }
  } catch (e) {
    // Handle parsing errors or invalid input formats
    print("Invalid input. Please enter integers.");
  }
}
