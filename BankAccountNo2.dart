import 'dart:io';
import 'AccountNo2.dart';

void main() {
  stdout.write('Masukkan nama pemegang akun: ');
  String name = stdin.readLineSync()!;
  stdout.write('Masukkan saldo awal: ');
  double initialBalance = double.parse(stdin.readLineSync()!);

  BankAccount account = BankAccount(name, initialBalance);

  bool running = true;

  while (running) {
    print('\n---Menu Bank BCA---');
    print('1. Tampilkan Informasi Akun');
    print('2. Setor Uang');
    print('3. Tarik Uang');
    print('4. Terapkan Bunga');
    print('5. Keluar');
    stdout.write('Pilih opsi: ');

    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        // Tampilkan informasi akun
        account.displayAccountInfo();
        break;

      case 2:
        // Setor uang
        stdout.write('Masukkan jumlah yang ingin disetor: ');
        double depositAmount = double.parse(stdin.readLineSync()!);
        account.deposit(depositAmount);
        break;

      case 3:
        // Tarik uang
        stdout.write('Masukkan jumlah yang ingin ditarik: ');
        double withdrawAmount = double.parse(stdin.readLineSync()!);
        account.withdraw(withdrawAmount);
        break;

      case 4:
        // Terapkan bunga
        account.applyInterest();
        break;

      case 5:
        // Keluar dari program
        running = false;
        print('Keluar...');
        break;

      default:
        print('Opsi tidak valid. Silakan coba lagi.');
    }
  }
}
