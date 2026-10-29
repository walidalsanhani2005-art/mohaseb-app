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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Cairo',
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  Widget buildTopButton(String title, IconData icon, {bool hasPlus = false}) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Stack(
            children: [
              Icon(icon, size: 50, color: Colors.black87),
              if (hasPlus)
                Positioned(
                  right: -5,
                  top: -5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.add, color: Colors.white, size: 20),
                  ),
                )
            ],
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              color: Color(0xFF1565A0),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
          )
        ],
      ),
    );
  }

  Widget buildMenuItem(String title) {
    return Container(
      color: Color(0xFF1A6FB0),
      child: Column(
        children: [
          ListTile(
            title: Text(title, 
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white, fontSize: 18)),
            trailing: Icon(Icons.keyboard_arrow_down, color: Colors.white),
          ),
          Divider(height: 1, color: Colors.white30),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1A6FB0),
        title: Text('محاسب سوفت', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: [Icon(Icons.share), SizedBox(width: 15)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top 4 buttons
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildTopButton('قبض/صرف', Icons.handshake_outlined),
                      buildTopButton('المبيعات', Icons.shopping_cart, hasPlus: true),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildTopButton('الحسابات', Icons.assessment),
                      buildTopButton('المشتريات', Icons.shopping_cart_outlined, hasPlus: true),
                    ],
                  ),
                ],
              ),
            ),
            
            // Expandable menus
            buildMenuItem('عمليات مخزنية'),
            buildMenuItem('قيود وحسابات'),
            buildMenuItem('أصناف'),
            buildMenuItem('العملات'),
            buildMenuItem('التقارير'),

            SizedBox(height: 30),

            // Bottom bar
            Container(
              color: Color(0xFF1A6FB0),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.help, color: Colors.white),
                  Text('المخزن الرئيسي', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  Icon(Icons.swap_horiz, color: Colors.white),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
