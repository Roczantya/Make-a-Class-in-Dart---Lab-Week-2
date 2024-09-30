class BankAccount {
  String _accountHolder; // Private attribute for account holder
  double _balance; // Private attribute for account balance
  static const double interestRate = 0.01; // Fixed interest rate of 1%
  static const double minTransactionAmount =
      50000; // Minimum transaction amount in Rupiah

  // Constructor for BankAccount class
  BankAccount(this._accountHolder, this._balance);

  // Getter for accountHolder
  String get accountHolder => _accountHolder;

  // Setter for accountHolder
  set accountHolder(String name) {
    _accountHolder = name;
  }

  // Getter for balance
  double get balance => _balance;

  // Setter for balance (optional, usually not exposed)
  set balance(double amount) {
    if (amount >= 0) {
      _balance = amount;
    } else {
      print('Balance cannot be negative.');
    }
  }

  // Method to deposit money
  void deposit(double amount) {
    if (amount < minTransactionAmount) {
      print('Jumlah setoran harus minimal Rp $minTransactionAmount');
      return;
    }
    _balance += amount;
    print('Setoran: Rp ${amount.toStringAsFixed(2)}');
    print('Saldo baru: Rp ${_balance.toStringAsFixed(2)}');
  }

  // Method to withdraw money
  void withdraw(double amount) {
    if (amount < minTransactionAmount) {
      print('Jumlah penarikan harus minimal Rp $minTransactionAmount');
      return;
    }
    if (amount > _balance) {
      print(
          'Dana tidak cukup. Saldo saat ini: Rp ${_balance.toStringAsFixed(2)}');
    } else {
      _balance -= amount;
      print('Penarikan: Rp ${amount.toStringAsFixed(2)}');
      print('Saldo baru: Rp ${_balance.toStringAsFixed(2)}');
    }
  }

  // Method to apply interest to the balance
  void applyInterest() {
    double interest = _balance * interestRate;
    _balance += interest;
    print('Bunga yang diterapkan: Rp ${interest.toStringAsFixed(2)}');
    print('Saldo baru setelah bunga: Rp ${_balance.toStringAsFixed(2)}');
  }

  // Method to display account information
  void displayAccountInfo() {
    print('Pemegang Akun: $_accountHolder');
    print('Saldo: Rp ${_balance.toStringAsFixed(2)}');
    print('Suku Bunga Bulanan: ${interestRate * 100}%');
  }
}
