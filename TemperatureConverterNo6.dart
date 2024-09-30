import 'dart:io';
import 'CelciusTempNo6.dart';

void main() {
  // Prompt user to enter a temperature in Celsius
  stdout.write('Masukkan temperature dalam Celcius (°C): ');
  double celsiusInput = double.parse(stdin.readLineSync()!);

  // Create an instance of Temperature
  Temperature temperature = Temperature(celsiusInput);

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
      double reaumur = temperature.toReaumur();
      print('${temperature.celsius} °C is equal to $reaumur °Re');
      break;
    case 2:
      double fahrenheit = temperature.toFahrenheit();
      print('${temperature.celsius} °C is equal to $fahrenheit °F');
      break;
    case 3:
      double kelvin = temperature.toKelvin();
      print('${temperature.celsius} °C is equal to $kelvin K');
      break;
    default:
      print('Invalid choice. Please enter 1, 2, or 3.');
  }
}
