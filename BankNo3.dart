class ATM {
  double _balance = 0; // Atribut privat untuk menyimpan saldo

  // Getter untuk saldo
  double get balance => _balance;

  // Setter untuk saldo (hanya untuk penggunaan internal)
  set balance(double amount) {
    if (amount >= 0) {
      // Memastikan saldo tidak negatif
      _balance = amount;
    } else {
      print('Saldo tidak dapat menjadi negatif.');
    }
  }

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
