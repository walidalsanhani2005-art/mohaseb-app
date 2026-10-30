import 'package:flutter/material.dart';

void main() {
  runApp(MohasebApp());
}

class MohasebApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'محاسب سوفت',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("محاسب سوفت"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 80),
            SizedBox(height: 20),
            Text("تم بناء التطبيق بنجاح ✅", style: TextStyle(fontSize: 22)),
            SizedBox(height: 10),
            Text("الآن يمكنك إضافة شاشات المبيعات", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
