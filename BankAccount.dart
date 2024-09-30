import 'dart:io';

class BankAccount {
  String accountHolder; // Pemegang akun
  double balance; // Saldo akun
  static const double interestRate = 0.01; // Suku bunga tetap 1%
  static const double minTransactionAmount =
      50000; // Jumlah transaksi minimum dalam Rupiah

  // Konstruktor untuk kelas BankAccount
  BankAccount(this.accountHolder, this.balance);

  // Metode untuk menyetor uang
  void deposit(double amount) {
    if (amount < minTransactionAmount) {
      print('Jumlah setoran harus minimal Rp $minTransactionAmount');
      return;
    }
    balance += amount;
    print('Setoran: Rp ${amount.toStringAsFixed(2)}');
    print('Saldo baru: Rp ${balance.toStringAsFixed(2)}');
  }

  // Metode untuk menarik uang
  void withdraw(double amount) {
    if (amount < minTransactionAmount) {
      print('Jumlah penarikan harus minimal Rp $minTransactionAmount');
      return;
    }
    if (amount > balance) {
      print(
          'Dana tidak cukup. Saldo saat ini: Rp ${balance.toStringAsFixed(2)}');
    } else {
      balance -= amount;
      print('Penarikan: Rp ${amount.toStringAsFixed(2)}');
      print('Saldo baru: Rp ${balance.toStringAsFixed(2)}');
    }
  }

  // Metode untuk menerapkan bunga pada saldo
  void applyInterest() {
    double interest = balance * interestRate;
    balance += interest;
    print('Bunga yang diterapkan: Rp ${interest.toStringAsFixed(2)}');
    print('Saldo baru setelah bunga: Rp ${balance.toStringAsFixed(2)}');
  }

  // Metode untuk menampilkan informasi akun
  void displayAccountInfo() {
    print('Pemegang Akun: $accountHolder');
    print('Saldo: Rp ${balance.toStringAsFixed(2)}');
    print('Suku Bunga Bulanan: ${interestRate * 100}%');
  }
}

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
