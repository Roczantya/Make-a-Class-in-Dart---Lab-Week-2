import 'dart:io';
import 'TransportationNo7.dart';

void main() {
  stdout.write(
      'Do you want to create a Car or a Bike? (Enter "Car" or "Bike"): ');
  String choice = stdin.readLineSync()!.toLowerCase();

  stdout.write('Enter the name of the vehicle: ');
  String name = stdin.readLineSync()!.trim(); // Trim whitespace

  stdout.write('Enter the speed of the vehicle (in km/h): ');

  // Speed validation
  double speed;
  try {
    speed = double.parse(stdin.readLineSync()!);
  } catch (e) {
    print('Invalid speed input. Please enter a valid number.');
    return;
  }

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
  
  // Optional: Display the vehicle information (if you have a method for it)
  print('Created Vehicle: ${vehicle.name}, Speed: ${vehicle.speed} km/h');
}
