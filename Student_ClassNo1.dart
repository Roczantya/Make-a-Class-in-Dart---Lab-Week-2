import 'dart:io';
import 'StudentNo1.dart';

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

  if (student.checkPass()) {
    print('Status: Passed');
  } else {
    print('Status: Failed');
  }
}
