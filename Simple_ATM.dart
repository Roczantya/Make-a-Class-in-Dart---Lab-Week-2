import 'dart:io';

class ATM {
  double _balance;

  ATM(this._balance);

  void Deposit(double Amount) {
    if (Amount > 0) {
      _balance += Amount;
      print('Deposited: \$${Amount}');
    } else {
      print('Mulailah coba menabung  ');
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print('Withdrawn: \$${amount}');
    } else if (amount > _balance) {
      print('Insufficient funds. Available balance: \$${_balance}');
    } else {
      print('Invalid withdrawal amount.');
    }
  }

  double checkbalance() {
    return _balance;
  }
}

void main() {
  // Input saldo awal dari pengguna
  stdout.write('Masukkan saldo awal: ');
  double initialBalance = double.parse(stdin.readLineSync()!);

  // Membuat objek ATM dengan saldo awal dari input pengguna
  ATM atm = ATM(initialBalance);

  bool running = true;

  while (running) {
    print('\n1. Deposit\n2. Withdraw\n3. Cek Saldo\n4. Keluar');
    stdout.write('Pilih opsi: ');
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        // Input untuk deposit
        stdout.write('Masukkan jumlah deposit: ');
        double depositAmount = double.parse(stdin.readLineSync()!);
        atm.Deposit(depositAmount);
        break;
      case 2:
        // Input untuk withdraw
        stdout.write('Masukkan jumlah penarikan: ');
        double withdrawAmount = double.parse(stdin.readLineSync()!);
        atm.withdraw(withdrawAmount);
        break;
      case 3:
        // Cek saldo
        print('Saldo saat ini: \$${atm.checkbalance()}');
        break;
      case 4:
        // Keluar dari program
        running = false;
        print('Keluar...');
        break;
      default:
        print('Pilihan tidak valid. Silakan coba lagi.');
    }
  }
}
