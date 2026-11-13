import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "وليد السنحاني",
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: Colors.green,
        ),
        body: Builder( // <-- هذا السطر الجديد بس!
          builder: (context) {
            return Align(
              alignment: Alignment.topLeft,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SalesPage(),
                    ),
                  );
                },
                child: Text("المبيعات"),
              ),
            );
          },
        ),
      ),
    ),
  );
}

class SalesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("المبيعات"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text(
          "هنا بتكون المبيعات",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
