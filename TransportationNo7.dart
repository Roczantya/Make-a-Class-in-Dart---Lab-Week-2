abstract class Vehicle {
  String _name; // Private attribute
  double _speed; // Private attribute

  Vehicle(this._name, this._speed);

  // Getter for name
  String get name => _name;

  // Setter for name
  set name(String name) {
    _name = name;
  }

  // Getter for speed
  double get speed => _speed;

  // Setter for speed with validation
  set speed(double speed) {
    if (speed >= 0) {
      _speed = speed;
    } else {
      print('Speed cannot be negative.');
    }
  }

  void move();

  void checkSpeed();
}

class Car extends Vehicle {
  Car(String name, double speed) : super(name, speed);

  @override
  void move() {
    print('$name (Car) is driving.');
    checkSpeed();
  }

  @override
  void checkSpeed() {
    String speedCategory;

    if (speed > 60) {
      speedCategory = 'fast';
    } else if (speed >= 30 && speed <= 60) {
      speedCategory = 'normal';
    } else {
      speedCategory = 'slow';
    }

    print(
        '$name (Car) is moving at $speed km/h, which is considered $speedCategory.');
  }
}

class Bike extends Vehicle {
  Bike(String name, double speed) : super(name, speed);

  @override
  void move() {
    print('$name (Bike) is cycling.');
    checkSpeed();
  }

  @override
  void checkSpeed() {
    String speedCategory;

    if (speed > 30) {
      speedCategory = 'fast';
    } else if (speed >= 10 && speed <= 20) {
      speedCategory = 'normal';
    } else {
      speedCategory = 'slow';
    }

    print(
        '$name (Bike) is moving at $speed km/h, which is considered $speedCategory.');
  }
}
