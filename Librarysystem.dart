import 'dart:io';

class Book {
  String title;
  String author;
  int year;

  // Constructor for Book class
  Book(this.title, this.author, this.year);

  // Method to display book information
  String displayInfo() {
    return 'Title: $title, Author: $author, Year: $year';
  }
}

class Library {
  List<Book> _books = []; // Private list to store books

  // Method to add a book to the library
  void addBook(Book book) {
    _books.add(book);
    print('Book added: ${book.title}');
  }

  // Method to remove a book from the library
  void removeBook(String title) {
    _books.removeWhere((book) => book.title == title);
    print('Book removed: $title');
  }

  // Method to display all books in the library
  void displayBooks() {
    if (_books.isEmpty) {
      print('No books in the library.');
      return;
    }
    print('Books in the library:');
    for (var book in _books) {
      print(book.displayInfo());
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
        // Input untuk menambahkan buku
        stdout.write('Enter book title: ');
        String title = stdin.readLineSync()!;
        stdout.write('Enter author name: ');
        String author = stdin.readLineSync()!;
        stdout.write('Enter publication year: ');
        int year = int.parse(stdin.readLineSync()!);
        library.addBook(Book(title, author, year));
        break;

      case 2:
        // Menampilkan semua buku
        library.displayBooks();
        break;

      case 3:
        // Input untuk menghapus buku
        stdout.write('Enter the title of the book to remove: ');
        String titleToRemove = stdin.readLineSync()!;
        library.removeBook(titleToRemove);
        break;

      case 4:
        // Keluar dari program
        running = false;
        print('Exiting...');
        break;

      default:
        print('Invalid option. Please try again.');
    }
  }
}
