import 'dart:io';

class Car {
  String carName;
  double carPrice;

  Car({required this.carName, required this.carPrice});

  void changePrice(double newPrice) {
    carPrice = newPrice;
  }
}

class Person {
  String personName;
  List<Car> ownedCars = [];
  double moneyLeft;

  Person({required this.personName, required this.moneyLeft});

  void buyCar(Car car) {
    if (moneyLeft >= car.carPrice) {
      ownedCars.add(car);
      moneyLeft -= car.carPrice;
      print(
        '$personName has bought the car ${car.carName} for a price of \$${car.carPrice}.\nRemaining balance : \$${moneyLeft}',
      );
    } else {
      print(
        'Unfortunately, $personName couldn\'t afford to buy the car ${car.carName} due to insufficient savings.',
      );
    }
  }

  void sellCar(Car car) {
    if (ownedCars.contains(car)) {
      ownedCars.remove(car);
      moneyLeft += car.carPrice;
      print(
        '$personName has sold the car ${car.carName} for \$${car.carPrice}. \nCurrent balance : \$$moneyLeft.',
      );
    } else {
      print(
        '$personName cannot sell ${car.carName} as he/she does not own it.',
      );
    }
  }
}

void main() {
  List<Car> cars = [
    Car(carName: 'Ford Focus', carPrice: 20000),
    Car(carName: 'Kia Seltos', carPrice: 24000),
    Car(carName: 'Chevrolet Malibu	', carPrice: 26000),
    Car(carName: 'Toyota Corolla', carPrice: 22000),
  ];

  stdout.write('Enter your name : ');
  String name = stdin.readLineSync()!;
  stdout.write('Enter the amount you currently possess : \$');
  double fund = double.parse(stdin.readLineSync()!);

  Person user = Person(personName: name, moneyLeft: fund);

  print(
    '\n\t\tMenu : \n\t1. View available cars\n\t2. Change car price\n\t3. Buy a car\n\t4. Sell a car\n\t5. View status of cars owned by $name\n\t6. Exit the app',
  );

  while (true) {
    stdout.write('\nEnter your choice : ');
    String? ch = stdin.readLineSync();

    switch (ch) {
      case '1':
        print('\n\tAvailable Cars :');
        int i = 1;
        for (var car in cars) {
          print('\t$i. ${car.carName.padRight(20)} \t \$${car.carPrice}');
          i++;
        }
        break;
      case '2':
        stdout.write(
          'Select the car whose price is to be changed from the available cars : ',
        );
        var car = stdin.readLineSync();
        bool found = false;
        stdout.write('Enter the new price : \$');
        var newPrice = double.parse(stdin.readLineSync()!);
        for (var doc in cars) {
          if (doc.carName == car) {
            doc.changePrice(newPrice);
            print('Price updated');
            found = true;
            break;
          }
        }
        if (!found) {
          print('Invalid selection');
          break;
        }
      case '3':
        stdout.write('Enter the car to be bought : ');
        var car = stdin.readLineSync();
        bool found = false;
        for (var doc in cars) {
          if (doc.carName == car) {
            user.buyCar(doc);
            found = true;
            break;
          }
        }
        if (!found) {
          print('Invalid selection');
          break;
        }
      case '4':
        stdout.write('Enter the car to be sold : ');
        var car = stdin.readLineSync();
        bool found = false;
        for (var doc in cars) {
          if (doc.carName == car) {
            user.sellCar(doc);
            found = true;
            break;
          }
        }
        if (!found) {
          print('Invalid selection');
          break;
        }
      case '5':
        print('\tOwned cars : ');
        if (user.ownedCars.isEmpty) {
          print('\tNone');
        } else {
          for (var doc in user.ownedCars) {
            print('\t- ${doc.carName.padRight(20)} \t ${doc.carPrice}');
          }
        }
        print('Money left: \$${user.moneyLeft.toStringAsFixed(2)}');
        break;
      case '6':
        print('\t\tExiting . . .');
        return;
      default:
        print('😞 Invalid choice. Try again');
    }
  }
}
