// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  String mesaj = "Merhaba ilk uygulamam";
  var students = [
    "Engin Demiroğ",
    "Yunus Emre Gündüz",
    "Kerem Varış",
    "Berkay Bilgin"
  ];
  int not = 85;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(students[index]);
                  })),
          Center(
            child: OutlinedButton(
              child: Text("Sonucu gör"),
              onPressed: () {
                var mesaj = sinavSonucHesapla(not=85);
                mesajGoster(mesaj,context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

String sinavSonucHesapla(int not) {
  String mesaj = "";
  if (not >= 75) {
    mesaj = "Geçti";
  } else if (not >= 40) {
    mesaj = "Büte Kaldı";
  } else {
    mesaj = "Kaldı";
  }
  return mesaj;
}
void mesajGoster(String mesaj,BuildContext context){
  var alert = AlertDialog(
    title:Text("Sınav sonucu"),
    content: Text(mesaj),
  );
  showDialog(context: context, builder: (BuildContext context)=>alert);
}
