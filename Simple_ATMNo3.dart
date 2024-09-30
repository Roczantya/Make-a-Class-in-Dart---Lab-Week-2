import 'dart:io';
import 'BankNo3.dart';

void main() {
  ATM atm = ATM();
  while (true) {
    print('--- Menu ATM ---');
    print('1. Setor Uang');
    print('2. Tarik Uang');
    print('3. Periksa Saldo');
    print('4. Keluar');
    stdout.write('Pilih opsi (1-4): ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Masukkan jumlah setoran: ');
        double depositAmount = double.parse(stdin.readLineSync()!);
        atm.deposit(depositAmount);
        break;
      case '2':
        stdout.write('Masukkan jumlah penarikan: ');
        double withdrawAmount = double.parse(stdin.readLineSync()!);
        atm.withdraw(withdrawAmount);
        break;
      case '3':
        print('Saldo saat ini: ${atm.checkBalance()} Rupiah');
        break;
      case '4':
        print('Terima kasih! Keluar dari ATM.');
        return;
      default:
        print('Pilihan tidak valid. Silakan coba lagi.');
    }
  }
}
