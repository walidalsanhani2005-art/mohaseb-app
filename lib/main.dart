import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
    ),
  );
}

// الصفحة الرئيسية
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تطبيقي', style: TextStyle(fontSize: 20)),
        backgroundColor: Color(0xFF357EC7),
      ),
      body: Align(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SalesPage()),
                );
              },
              child: Text('المبيعات'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PurchasesPage()),
                );
              },
              child: Text('المشتريات'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QabdSarafPage()),
                );
              },
              child: Text('قبض / صرف'),
            ),
          ],
        ),
      ),
    );
  }
}

// صفحة المبيعات
class SalesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF357EC7),
        title: Text('قائمه المبيعات', style: TextStyle(fontSize: 20)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AjalPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// صفحة بيع اجل
class AjalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF357EC7),
        title: Text('بيع اجل', style: TextStyle(fontSize: 20)),
      ),
      body: Center(
        child: Text('هنا صفحة بيع اجل'),
      ),
    );
  }
}

// صفحة المشتريات
class PurchasesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF357EC7),
        title: Text('المشتريات', style: TextStyle(fontSize: 20)),
      ),
      body: Center(
        child: Text('هنا صفحة المشتريات'),
      ),
    );
  }
}

// صفحة قبض / صرف الجديدة
class QabdSarafPage extends
