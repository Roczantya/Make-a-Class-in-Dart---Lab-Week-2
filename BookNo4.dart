import 'dart:io';

class Book {
  // Atribut private
  String _title;
  String _author;
  int _year;

  // Constructor for Book class
  Book(this._title, this._author, this._year);

  // Getter untuk Title
  String get title => _title;

  // Setter untuk Title
  set title(String title) {
    _title = title;
  }

  // Getter untuk Author
  String get author => _author;

  // Setter untuk Author
  set author(String author) {
    _author = author;
  }

  // Getter untuk Year
  int get year => _year;

  // Setter untuk Year
  set year(int year) {
    if (year > 0) {
      // Validasi untuk memastikan tahun positif
      _year = year;
    } else {
      print("Year must be greater than 0");
    }
  }

  // Method to display book information in two lines
  String displayInfo() {
    return 'Title: $_title\nAuthor: $_author\nYear: $_year';
  }
}

class Library {
  List<Book> _books = []; // Private list to store books
  List<Book> _removedBooks = []; // Private list to store removed books

  // Method to add a book to the library
  void addBook(Book book) {
    _books.add(book);
    print('Book added: ${book.title}');
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
      print('Book removed: ${bookToRemove.title}');
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
