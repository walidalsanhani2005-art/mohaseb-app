import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "علي",
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: Colors.green,
        ),
        body: Align(
          alignment: Alignment.topLeft,
          child: ElevatedButton(
            onPressed: () {
              // هنا ايش يصير لما تضغط الزر
              print("تم الضغط على الزر");
            },
            child: Text("المبيعات"),
          ),
        ),
      ),
    ),
  );
}
