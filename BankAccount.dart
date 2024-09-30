import 'dart:io';

class BankAccount {
  double _balance;

  BankAccount(this._balance);

  void Deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('Deposite: \$${amount}');
    } else {
      print('Mulailah coba deposito');
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print('WithDraw: \$${amount}');
    } else {
      print('invalid withdrawal amount');
    }
  }

  double checkbalance() {
    return _balance;
  }
}

class SavingAccount extends BankAccount {
  double InterestRate;

  SavingAccount(double balance, this.InterestRate) : super(balance);

  void applyInterest() {
    double interest = checkbalance() * InterestRate / 100;
    Deposit(interest);
    print('Interest applied: \$${interest}');
  }
}

void main() {
  // Get initial balance from user
  stdout.write('Enter initial balance: ');
  double initialBalance = double.parse(stdin.readLineSync()!);

  // Get interest rate for SavingsAccount
  stdout.write('Enter interest rate (in %): ');
  double interestRate = double.parse(stdin.readLineSync()!);

  // Create a SavingsAccount object
  SavingAccount savings = SavingAccount(initialBalance, interestRate);

  bool running = true;

  while (running) {
    print(
        '\n1. Deposit\n2. Withdraw\n3. Check Balance\n4. Apply Interest\n5. Exit');
    stdout.write('Choose an option: ');
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        stdout.write('Enter amount to deposit: ');
        double depositAmount = double.parse(stdin.readLineSync()!);
        savings.Deposit(depositAmount);
        break;
      case 2:
        stdout.write('Enter amount to withdraw: ');
        double withdrawAmount = double.parse(stdin.readLineSync()!);
        savings.withdraw(withdrawAmount);
        break;
      case 3:
        print('Balance: \$${savings.checkbalance()}');
        break;
      case 4:
        savings.applyInterest();
        break;
      case 5:
        running = false;
        print('Exiting...');
        break;
      default:
        print('Invalid option. Please try again.');
    }
  }
}
