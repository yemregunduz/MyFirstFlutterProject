// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable, prefer_initializing_formals, must_be_immutable

import 'package:flutter/material.dart';
import 'package:temel_widget/main.dart';
import 'package:temel_widget/models/student.dart';
import 'package:temel_widget/validation/student_validator.dart';

class StudentEdit extends StatefulWidget {
  late Student selectedStudent;
  StudentEdit(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }
  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _StudentAddState(selectedStudent);
  }
}


class _StudentAddState extends State with StudentValidationMixIn {
  late Student selectedStudent;
  var formKey = GlobalKey<FormState>();
  _StudentAddState(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
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
      initialValue: selectedStudent.firstName,
      validator: (String? value) {
        return validateFirstName(value.toString());
      },
      onSaved: (String? value) {
        selectedStudent.firstName = value.toString();
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
      initialValue: selectedStudent.lastName,
      validator: (String? value) {
        return validateLastName(value.toString());
      },
      onSaved: (String? value) {
        selectedStudent.lastName = value.toString();
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
      initialValue: selectedStudent.grade.toString(),
      validator: (String? value) {
        return validateGrade(value.toString());
      },
      onSaved: (String? value) {
        selectedStudent.grade = int.parse(value.toString());
      },
    );
  }

  Widget buildSubmitButton() {
    return OutlinedButton (
      child: Text("Güncelle"),
      onPressed: () {
          if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));
        }
      },
    );
  }
}
