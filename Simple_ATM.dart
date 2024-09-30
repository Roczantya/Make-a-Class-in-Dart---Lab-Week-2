import 'dart:io';

class ATM {
  double _balance = 0; // Atribut privat untuk menyimpan saldo

  void deposit(double amount) {
    // Menyimpan uang ke dalam rekening
    if (amount >= 50000) {
      // Jumlah deposit minimum
      _balance += amount;
      print('Berhasil menyetor: $amount Rupiah');
    } else {
      print('Jumlah setoran minimum adalah 50.000 Rupiah');
    }
  }

  void withdraw(double amount) {
    // Menarik uang dari rekening
    if (amount >= 50000) {
      // Jumlah penarikan minimum
      if (amount <= _balance) {
        _balance -= amount;
        print('Berhasil menarik: $amount Rupiah');
      } else {
        print('Saldo tidak cukup');
      }
    } else {
      print('Jumlah penarikan minimum adalah 50.000 Rupiah');
    }
  }

  double checkBalance() {
    // Memeriksa saldo saat ini
    return _balance;
  }
}

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
