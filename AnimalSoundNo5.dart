import 'dart:io';
import 'AnimalNo5.dart';

void main() {
  List<Animal> animals = []; // List to hold animal objects

  while (true) {
    // Displaying the menu
    print('\n--- Animal Management Menu ---');
    print('1. Add Dog');
    print('2. Add Cat');
    print('3. Make Animals Sound');
    print('4. Feed Animals');
    print('5. List All Animals');
    print('6. Exit');
    stdout.write('Enter your choice (1-6): ');

    String? input = stdin.readLineSync(); // Get user input

    if (input == null || input.isEmpty) {
      print('Please enter a valid choice.');
      continue; // Skip the rest of the loop if input is empty
    }

    int choice;
    try {
      choice = int.parse(input);
    } catch (e) {
      print('Invalid choice. Please enter a number between 1 and 6.');
      continue;
    }

    switch (choice) {
      case 1: // Add Dog
        stdout.write('Enter the name of the dog: ');
        String? dogName = stdin.readLineSync();
        if (dogName != null && dogName.isNotEmpty) {
          animals.add(Dog(dogName));
          print('Added a dog named $dogName.');
        } else {
          print('Invalid name for the dog.');
        }
        break;

      case 2: // Add Cat
        stdout.write('Enter the name of the cat: ');
        String? catName = stdin.readLineSync();
        if (catName != null && catName.isNotEmpty) {
          animals.add(Cat(catName));
          print('Added a cat named $catName.');
        } else {
          print('Invalid name for the cat.');
        }
        break;

      case 3: // Make Animals Sound
        if (animals.isEmpty) {
          print('No animals in the list.');
        } else {
          for (var animal in animals) {
            animal.sound(); // Call sound method for each animal
          }
        }
        break;

      case 4: // Feed Animals
        if (animals.isEmpty) {
          print('No animals in the list.');
        } else {
          for (var animal in animals) {
            animal.eat(); // Call eat method for each animal
          }
        }
        break;

      case 5: // List All Animals
        if (animals.isEmpty) {
          print('No animals in the list.');
        } else {
          print('Animals in the list:');
          for (var animal in animals) {
            print('- ${animal.name} (${animal.runtimeType})');
          }
        }
        break;

      case 6: // Exit
        print('Exiting the program.');
        return; // Exit the program

      default: // Invalid choice
        print('Invalid choice. Please enter a number between 1 and 6.');
    }
  }
}
