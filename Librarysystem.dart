import 'dart:io';

class Book {
  String Title;
  String Author;
  int Year;

  // Constructor for Book class
  Book(this.Title, this.Author, this.Year);

  // Method to display book information in two lines
  String displayInfo() {
    return '${Title}\nAuthor: $Author\nYear: $Year';
  }
}

class Library {
  List<Book> _books = []; // Private list to store books
  List<Book> _removedBooks = []; // Private list to store removed books

  // Method to add a book to the library
  void addBook(Book book) {
    _books.add(book);
    print('Book added: ${book.Title}');
  }

  // Method to remove a book from the library
  void removeBook(int index) {
    if (index < 0 || index >= _books.length) {
      print('Invalid index. Unable to remove book.');
      return;
    }

    Book bookToRemove = _books[index];
    print('Found book:\n${bookToRemove.displayInfo()}');
    stdout.write('Are you sure you want to remove this book? (yes/no): ');
    String confirmation = stdin.readLineSync()!.toLowerCase();

    if (confirmation == 'yes') {
      _books.removeAt(index);
      _removedBooks.add(bookToRemove); // Add to removed books list
      print('Book removed: ${bookToRemove.Title}');
    } else {
      print('Removal canceled.');
    }
  }

  // Method to display all books in the library
  void displayBooks() {
    if (_books.isEmpty) {
      print('No books available in the library.');
    } else {
      print('Available books:');
      for (var i = 0; i < _books.length; i++) {
        print('${i + 1}. ${_books[i].displayInfo()}');
      }
    }

    // Display removed books
    if (_removedBooks.isNotEmpty) {
      print('\nRemoved books:');
      for (var book in _removedBooks) {
        print(book.displayInfo());
      }
    }
  }
}

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
