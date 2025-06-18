import 'dart:io';
import 'dart:math';

class PasswordManager {
  final Random _random = Random();

  String passwordValidator(String password) {
    final hasUpperCase = RegExp(r'[A-Z]').hasMatch(password);
    final hasLowerCase = RegExp(r'[a-z]').hasMatch(password);
    final hasDigits = RegExp(r'[0-9]').hasMatch(password);
    final hasSpecialCharacters = RegExp(
      r'[!@#\$%^&*(),.?":{}|<>]',
    ).hasMatch(password);

    if (password.length >= 12 &&
        hasUpperCase &&
        hasLowerCase &&
        hasDigits &&
        hasSpecialCharacters) {
      return 'Strong';
    } else if (password.length >= 8 && hasLowerCase && hasDigits) {
      return 'Intermediate';
    } else {
      return 'Weak';
    }
  }

  String _generator(int length, String characters) {
    return List.generate(
      length,
      (index) => characters[_random.nextInt(characters.length)],
    ).join();
  }

  String passwordGenerator(String strength) {
    switch (strength) {
      case 'Strong':
        var characters =
            'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#\$%^&*(),.?":{}|<>';
        return _generator(12, characters);

      case 'Intermediate':
        var characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
        return _generator(8, characters);

      case 'Weak':
        var characters = 'abcdefghijklmnopqrstuvwxyz';
        return _generator(4, characters);

      default:
        print('Invalid Strength');
        return '';
    }
  }
}

void main() {
  final manager = PasswordManager();

  print('\n----- Password Manager -----');
  print('1. Generate Strong Password');
  print('2. Generate Intermediate Password');
  print('3. Generate Weak Password');
  print('4. Validate a Password');
  print('5. Exit');

  while (true) {
    stdout.write('\nEnter your choice : ');
    var ch = stdin.readLineSync();

    switch (ch) {
      case '1':
        print('Generated password : ${manager.passwordGenerator('Strong')}');
        break;

      case '2':
        print(
          'Generated password : ${manager.passwordGenerator('Intermediate')}',
        );
        break;

      case '3':
        print('Generated password : ${manager.passwordGenerator('Weak')}');
        break;

      case '4':
        stdout.write('Enter your password that is to be validated : ');
        String? password = stdin.readLineSync();
        print('Password Strength : ${manager.passwordValidator(password!)}');
        break;

      case '5':
        print('Exiting . . .');
        return;

      default:
        print('Invalid Choice. Try Again');
    }
  }
}
