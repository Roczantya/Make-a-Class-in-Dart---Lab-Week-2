abstract class Animal {
  String name;

  Animal(this.name);

  void sound();

  void eat() {
    print('$name is eating.');
  }
}

// Dog class extending Animal
class Dog extends Animal {
  Dog(String name) : super(name);

  @override
  void sound() {
    print('$name says: Woof! Woof!');
  }
}

// Cat class extending Animal
class Cat extends Animal {
  Cat(String name) : super(name);

  @override
  void sound() {
    print('$name says: Meow! Meow!');
  }
}
