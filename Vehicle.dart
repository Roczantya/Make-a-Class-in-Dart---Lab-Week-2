import 'dart:io';

abstract class Vehicle {
  String name;
  double speed;

  Vehicle(this.name, this.speed);

  void move();

  // Define a method to check speed, but allow subclasses to implement their own logic
  void checkSpeed();
}

class Car extends Vehicle {
  Car(String name, double speed) : super(name, speed);

  @override
  void move() {
    print('$name (Car) is driving.');
    checkSpeed();
  }

  @override
  void checkSpeed() {
    String speedCategory;

    if (speed > 80) {
      speedCategory = 'fast';
    } else if (speed >= 40 && speed <= 70) {
      speedCategory = 'normal';
    } else {
      speedCategory = 'slow';
    }

    print(
        '$name (Car) is moving at $speed km/h, which is considered $speedCategory.');
  }
}

class Bike extends Vehicle {
  Bike(String name, double speed) : super(name, speed);

  @override
  void move() {
    print('$name (Bike) is cycling.');
    checkSpeed();
  }

  @override
  void checkSpeed() {
    String speedCategory;

    if (speed > 30) {
      speedCategory = 'fast';
    } else if (speed >= 10 && speed <= 20) {
      speedCategory = 'normal';
    } else {
      speedCategory = 'slow';
    }

    print(
        '$name (Bike) is moving at $speed km/h, which is considered $speedCategory.');
  }
}

void main() {
  stdout.write(
      'Do you want to create a Car or a Bike? (Enter "Car" or "Bike"): ');
  String choice = stdin.readLineSync()!.toLowerCase();

  stdout.write('Enter the name of the vehicle: ');
  String name = stdin.readLineSync()!;

  stdout.write('Enter the speed of the vehicle (in km/h): ');
  double speed = double.parse(stdin.readLineSync()!);

  Vehicle vehicle;

  // Create an instance based on user input
  if (choice == 'car') {
    vehicle = Car(name, speed);
  } else if (choice == 'bike') {
    vehicle = Bike(name, speed);
  } else {
    print('Invalid choice. Please enter "Car" or "Bike".');
    return;
  }

  // Call the move method
  vehicle.move();
}
