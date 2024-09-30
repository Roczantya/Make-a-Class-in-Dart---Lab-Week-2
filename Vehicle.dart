import 'dart:io';

// Base class Vehicle
abstract class Vehicle {
  String name;
  double speed;

  // Constructor for Vehicle
  Vehicle(this.name, this.speed);

  // Abstract method to be implemented by subclasses
  void move();
}

// Subclass Car that extends Vehicle
class Car extends Vehicle {
  Car(String name, double speed) : super(name, speed);

  @override
  void move() {
    print('The $name moves fast on roads at $speed km/h.');
  }
}

// Subclass Bike that extends Vehicle
class Bike extends Vehicle {
  Bike(String name, double speed) : super(name, speed);

  @override
  void move() {
    print('The $name moves swiftly through traffic at $speed km/h.');
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
