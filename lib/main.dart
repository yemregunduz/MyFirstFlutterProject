// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:temel_widget/models/student.dart';
import 'package:temel_widget/screens/student-edit.dart';
import 'package:temel_widget/screens/student_add.dart';

List<Student> students = [
  Student.withId(1, "Yunus Emre", "Gündüz", 25),
  Student.withId(2, "Fatma Nur", "Karaman", 65),
  Student.withId(3, "Fatih Mehmet", "Gündüz", 85),
];
void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String appBarmesaj = "Öğrenci Takip Sistemi";

  Student selectedStudent = Student.withId(0, "", "", 0);

  var students = getAllStudent();

  int not = 85;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appBarmesaj),
        ),
        body: buildBody(context));
  }

  Widget buildBody(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (BuildContext context, int i) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://cdn.pixabay.com/photo/2017/06/22/02/16/computer-icon-2429310_960_720.png"),
                        backgroundColor: Colors.white,
                      ),
                      title: Text(
                          students[i].firstName + " " + students[i].lastName),
                      subtitle: Text("Sınavdan aldığı not: " +
                          students[i].grade.toString() +
                          "[" +
                          students[i].getStatus +
                          "]"),
                      trailing: buildStatusIcon(students[i].grade),
                      onTap: () {
                        setState(() {
                          selectedStudent = students[i];
                        });
                      },
                    );
                  })),
          Text("Seçili öğrenci:" +
              selectedStudent.firstName +
              " " +
              selectedStudent.lastName),
          SafeArea(
            child: Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        Text("Yeni Öğrenci"),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StudentAdd(students)));
                              
                    },
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
                    child: Row(
                      children: [
                        Icon(Icons.update),
                        SizedBox(width: 5.0),
                        Text("Güncelle"),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StudentEdit(selectedStudent)));
                    },
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete_forever,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          "Sil",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        deleteStudentFromList(selectedStudent);
                      });
                      var message = "Silindi:" +
                          selectedStudent.firstName +
                          " " +
                          selectedStudent.lastName;
                      selectedStudent = Student.withId(0, "", "", 0);
                      showMessage(message, context);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void showMessage(String message, BuildContext context) {
  var alert = AlertDialog(
    title: Text("Silme işlemi başarılı"),
    content: Text(message),
  );
  showDialog(context: context, builder: (BuildContext context) => alert);
}

List<Student> getAllStudent() {
  return students;
}
Widget buildStatusIcon(int grade) {
  if (grade >= 75) {
    return Icon(Icons.done, color: Colors.green);
  } else if (grade >= 40) {
    return Icon(
      Icons.pending,
      color: Colors.blue,
    );
  } else {
    return Icon(Icons.clear, color: Colors.red);
  }
}

deleteStudentFromList(Student student) {
  students.remove(student);
}
