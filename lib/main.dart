import 'package:flutter/material.dart';
import 'screens/sales_screen.dart';

void main() {
  runApp(MohasebApp());
}

class MohasebApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'محاسب سوفت',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Cairo'),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("محاسب سوفت - صنعاء"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildButton(context, "المبيعات", Icons.point_of_sale, Colors.green, SalesScreen()),
            SizedBox(height: 12),
            _buildButton(context, "المشتريات", Icons.shopping_cart, Colors.orange, null),
            SizedBox(height: 12),
            _buildButton(context, "التقارير", Icons.bar_chart, Colors.purple, null),
            SizedBox(height: 12),
            _buildButton(context, "العملاء", Icons.people, Colors.teal, null),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String title, IconData icon, Color color, Widget? page) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(double.infinity, 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: () {
        if (page != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => page));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$title قريباً")));
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 10),
          Text(title, style: TextStyle(fontSize: 18, color: Colors.white)),
        ],
      ),
    );
  }
}
