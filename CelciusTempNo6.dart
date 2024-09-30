class Temperature {
  double _celsius; // Private attribute for Celsius temperature

  // Constructor to initialize Celsius temperature
  Temperature(this._celsius);

  // Getter for Celsius temperature
  double get celsius => _celsius;

  // Setter for Celsius temperature
  set celsius(double value) {
    _celsius = value;
  }

  // Method to convert Celsius to Reaumur
  double toReaumur() {
    return _celsius * 0.8;
  }

  // Method to convert Celsius to Fahrenheit
  double toFahrenheit() {
    return (_celsius * 9 / 5) + 32;
  }

  // Method to convert Celsius to Kelvin
  double toKelvin() {
    return _celsius + 273.15;
  }
}
