import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
    ),
  );
}

// الصفحة الأولى
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('علي'),
        backgroundColor: Colors.green,
      ),
      body: Align(
        alignment: Alignment.topLeft,
        child: ElevatedButton(
          onPressed: () {
            // هنا التغيير الوحيد!
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SalesPage()),
            );
          },
          child: Text('المبيعات'),
        ),
      ),
    );
  }
}

// الصفحة الثانية - قائمة المبيعات
class SalesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('قائمة المبيعات'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          ListTile(title: Text('زبون: علي - باع بـ 100 ريال')),
          ListTile(title: Text('زبون: محمد - باع بـ 200 ريال')),
          ListTile(title: Text('زبون: أحمد - باع بـ 150 ريال')),
        ],
      ),
    );
  }
}
