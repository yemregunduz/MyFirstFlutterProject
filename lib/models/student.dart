// ignore_for_file: prefer_initializing_formals, unnecessary_this, unused_field

class Student {
  late int id;
  late String firstName;
  late String lastName;
  late int grade;
  late String _status;

  Student.withId(int id,String firstName, String lastName, int grade) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this.id = id;
  }
  Student(String firstName, String lastName, int grade) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }
  // ignore: empty_constructor_bodies
  Student.withoutInfo(){
    
  }

  String get getStatus {
    String message = "";
    if (this.grade >= 75) {
      message = "Geçti";
    } else if (this.grade >= 40) {
      message = "Büte Kaldı";
    } else {
      message = "Kaldı";
    }
    return message;
  }
}
