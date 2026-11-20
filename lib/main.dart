import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'علي',
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.green,
      ),
      body: Align(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => salesPage(),
                  ),
                );
              },
              child: Text('المبيعات'),
            ),
          ],
        ),
      ),
    );
  }
}

class salesPage extends StatefulWidget {
  @override
  State<salesPage> createState() => _salesPageState();
}

class _salesPageState extends State<salesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('المبيعات'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InvoicePage(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class InvoicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الفاتورة'),
      ),
      body: Center(
        child: Text('صفحة الفاتورة'),
      ),
    );
  }
}
