class Student {
  // Private attributes
  String _name;
  int _studentID;
  int _grade;

  // Constructor
  Student(this._name, this._studentID, this._grade);

  // Getter for name
  String get name => _name;

  // Setter for name
  set name(String name) {
    _name = name;
  }

  // Getter for studentID
  int get studentID => _studentID;

  // Setter for studentID
  set studentID(int id) {
    _studentID = id;
  }

  // Getter for grade
  int get grade => _grade;

  // Setter for grade
  set grade(int grade) {
    if (grade >= 0 && grade <= 100) {
      // Validating grade range
      _grade = grade;
    } else {
      print('Grade must be between 0 and 100.');
    }
  }

  // Method to display student information
  void displayInfo() {
    print('Student ID: $_studentID');
    print('Name: $_name');
    print('Grade: $_grade');
  }

  // Method to check if the student passed
  bool checkPass() {
    return _grade >= 70;
  }
}
