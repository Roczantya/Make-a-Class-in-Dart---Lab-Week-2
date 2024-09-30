import 'dart:io';

void main() {
  // Prompt user to enter a temperature in Celcius
  stdout.write('Masukkan temperature dalam Celcius (°C) : ');
  double Celcius = double.parse(stdin.readLineSync()!);

  // Display conversion options
  print('Ubah ke temperatur apa:');
  print('1. Reaumur');
  print('2. Fahrenheit');
  print('3. Kelvin');
  stdout.write('Masukkan pilihan (1/2/3): ');
  int choice = int.parse(stdin.readLineSync()!);

  // Perform conversion based on user choice
  switch (choice) {
    case 1:
      double reaumur = Celcius * 0.8;
      print('$Celcius °C is equal to $reaumur °Re');
      break;
    case 2:
      double fahrenheit = (Celcius * 9 / 5) + 32;
      print('$Celcius °C is equal to $fahrenheit °F');
      break;
    case 3:
      double kelvin = Celcius + 273.15;
      print('$Celcius °C is equal to $kelvin K');
      break;
    default:
      print('Invalid choice. Please enter 1, 2, or 3.');
  }
}
