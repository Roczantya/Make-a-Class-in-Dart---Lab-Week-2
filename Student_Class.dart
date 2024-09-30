import 'dart:io';

class Student {
  String name;
  int studentID;
  int grade;

  Student(this.name, this.studentID, this.grade);

  void displayInfo() {
    print('Studet ID: $studentID');
    print('Name: $name');
    print('Grade: $grade');
  }

  bool checkpass() {
    return grade >= 70;
  }
}

void main() {
  stdout.write('Enter Student ID: ');
  String? studentIDinput = stdin.readLineSync();
  int studentID = int.parse(studentIDinput!);

  stdout.write('Enter Student name: ');
  String? name = stdin.readLineSync();

  stdout.write('Enter Student grade: ');
  String? gradeinput = stdin.readLineSync();
  int grade = int.parse(gradeinput!);

  Student student = Student(name!, studentID, grade);

  student.displayInfo();

  if (student.checkpass()) {
    print('Status: Passed');
  } else {
    print('Status: Failed');
  }
}
