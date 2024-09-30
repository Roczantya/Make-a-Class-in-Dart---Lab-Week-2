import 'dart:io';
import 'BookNo4.dart';

void main() {
  Library library = Library();
  bool running = true;

  while (running) {
    print('\nMenu:');
    print('1. Add Book');
    print('2. Display Books');
    print('3. Remove Book');
    print('4. Exit');
    stdout.write('Choose an option: ');

    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        // Input to add a book
        stdout.write('Enter book Title: ');
        String Title = stdin.readLineSync()!;
        stdout.write('Enter Author name: ');
        String Author = stdin.readLineSync()!;
        stdout.write('Enter publication Year: ');
        int Year = int.parse(stdin.readLineSync()!);
        library.addBook(Book(Title, Author, Year));
        break;

      case 2:
        // Displaying all books
        library.displayBooks();
        break;

      case 3:
        // Input to remove a book
        library.displayBooks(); // Show available books before removing
        stdout.write('Enter the number of the book to remove: ');
        int bookIndex =
            int.parse(stdin.readLineSync()!) - 1; // Adjust for zero-based index
        library.removeBook(bookIndex);
        break;

      case 4:
        // Exit the program
        running = false;
        print('Exiting...');
        break;

      default:
        print('Invalid option. Please try again.');
    }
  }
}
