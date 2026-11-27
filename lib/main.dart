import 'package:flutter/material.dart';
import 'bai_ajel_page.dart';
void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تطبيقي', style: TextStyle(fontSize: 20)),
        backgroundColor: Color(0xFF25587E),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // ===== الصف الأول =====
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SalesPage()),
                      );
                    },
                    child: Text('المبيعات'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewSandPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('سند جديد'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QabdPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF25587E),
                      foregroundColor: Colors.white,
                    ),
                    child: Text('سند قبض'),
                  ),
                ),
              ],
            ),

            SizedBox(height: 15),

            // ===== الصف الثاني =====
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OrdersPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text('عروض / طلبيات', style: TextStyle(fontSize: 14)),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HawalaPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text('حوالة جديدة', style: TextStyle(fontSize: 14)),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FatoraPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text('فاتورة جديدة', style: TextStyle(fontSize: 14)),
                  ),
                ),
              ],
            ),

            SizedBox(height: 15),

            // ===== الصف الثالث: 3 أزرار =====
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => KashfPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text('كشف حساب', style: TextStyle(fontSize: 14)),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SarfPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text('صرف العملات', style: TextStyle(fontSize: 14)),
                  ),
                ),
                SizedBox(width: 10),
                // ===== الزر الثالث: مراجعة الحركات - الجديد =====
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MurajaaPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text('مراجعة الحركات', style: TextStyle(fontSize: 14)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewSandPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class SalesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('قائمة المبيعات', style: TextStyle(fontSize: 20)),
        backgroundColor: Color(0xFF25587E),
        foregroundColor: Colors.white,
      ),
      body: Padding(
  padding: EdgeInsets.all(16),
  child: GridView.count(
    crossAxisCount: 2,
    crossAxisSpacing: 16,
    mainAxisSpacing: 16,
    children: [
      // أيقونة بيع نقدي
      InkWell(
        onTap: () {
          // هنا بتوديك لصفحة البيع النقدي
          // بنسويها بعدين
        },
        child: Card(
          color: Colors.green[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.money, size: 50, color: Colors.green),
              SizedBox(height: 10),
              Text('بيع نقدي', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),

      // أيقونة بيع آجل
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BaiAjelPage(),
            ),
          );
        },
        child: Card(
          color: Colors.orange[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.calendar_month, size: 50, color: Colors.orange),
              SizedBox(height: 10),
              Text('بيع آجل', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    ],
  ),
),
    );
  }
}

class NewSandPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('سند جديد', style: TextStyle(fontSize: 20)),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(child: Text('هنا تسوي سند جديد')),
    );
  }
}

class QabdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('سند قبض', style: TextStyle(fontSize: 20)),
        backgroundColor: Color(0xFF25587E),
        foregroundColor: Colors.white,
      ),
      body: Center(child: Text('هنا سند قبض')),
    );
  }
}

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('عروض / طلبيات', style: TextStyle(fontSize: 20)),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Center(child: Text('هنا عروض / طلبيات')),
    );
  }
}

class HawalaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('حوالة جديدة', style: TextStyle(fontSize: 20)),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Center(child: Text('هنا تسوي حوالة جديدة')),
    );
  }
}

class FatoraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('فاتورة جديدة', style: TextStyle(fontSize: 20)),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Center(child: Text('هنا تسوي فاتورة جديدة')),
    );
  }
}

class KashfPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('كشف حساب', style: TextStyle(fontSize: 20)),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Center(child: Text('هنا كشف حساب')),
    );
  }
}

class SarfPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('صرف العملات', style: TextStyle(fontSize: 20)),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(child: Text('هنا صرف العملات')),
    );
  }
}

// ===== الصفحة الجديدة: مراجعة الحركات =====
class MurajaaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('مراجعة الحركات', style: TextStyle(fontSize: 20)),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
      ),
      body: Center(child: Text('هنا مراجعة الحركات')),
    );
  }
}
