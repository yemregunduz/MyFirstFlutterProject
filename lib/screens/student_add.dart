// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable, prefer_initializing_formals, must_be_immutable

import 'package:flutter/material.dart';
import 'package:temel_widget/models/student.dart';
import 'package:temel_widget/validation/student_validator.dart';

class StudentAdd extends StatefulWidget {
  late List<Student> students;
  StudentAdd(List<Student> students) {
    this.students = students;
  }
  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _StudentAddState(students);
  }
}


class _StudentAddState extends State with StudentValidationMixIn {
  late List<Student> students;
  var student = Student.withoutInfo();
  var formKey = GlobalKey<FormState>();
  _StudentAddState(List<Student> students) {
    this.students = students;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(     
        appBar: AppBar(
          title: Text("Yeni öğrenci ekle"),
        ),
        // ignore: avoid_unnecessary_containers
        body: Container(
          margin: EdgeInsets.all(20.0),
          padding: EdgeInsets.only(top: 10.0),
          child: Form(
            key: formKey,
            child: Column(children: [
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton(),
            ]),
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Öğrenci adı",
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        hintText: "Yunus Emre",
      ),
      validator: (String? value) {
        return validateFirstName(value.toString());
      },
      onSaved: (String? value) {
        student.firstName = value.toString();
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Öğrenci soyadı",
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        hintText: "Gündüz",
      ),
      validator: (String? value) {
        return validateLastName(value.toString());
      },
      onSaved: (String? value) {
        student.lastName = value.toString();
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Aldığı not",
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        hintText: "95",
      ),
      validator: (String? value) {
        return validateGrade(value.toString());
      },
      onSaved: (String? value) {
        student.grade = int.parse(value.toString());
      },
    );
  }

  Widget buildSubmitButton() {
    return OutlinedButton (
      child: Text("Kaydet"),
      onPressed: () {
          if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          students.add(student);
          Navigator.pop(context);
        }
      },
    );
  }
}
