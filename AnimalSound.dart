// Base class Animal
abstract class Animal {
  // Method to be implemented by subclasses
  void sound();

  // Method to describe eating behavior
  void eat() {
    print('This animal is eating.');
  }
}

// Subclass Dog that extends Animal
class Dog extends Animal {
  @override
  void sound() {
    print('Woof! Woof!');
  }

  @override
  void eat() {
    print('The dog is eating dog food.');
  }
}

// Subclass Cat that extends Animal
class Cat extends Animal {
  @override
  void sound() {
    print('Meow! Meow!');
  }

  @override
  void eat() {
    print('The cat is eating cat food.');
  }
}

void main() {
  // Create instances of Dog and Cat
  Animal dog = Dog();
  Animal cat = Cat();

  // Call methods on the Dog instance
  print('Dog:');
  dog.sound();
  dog.eat();

  // Call methods on the Cat instance
  print('\nCat:');
  cat.sound();
  cat.eat();
}
