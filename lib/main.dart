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

class PurchasesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF357EC7),
        title: Text('المشتريات', style: TextStyle(fontSize: 20)),
      ),
      body: Center(child: Text('هنا صفحة المشتريات')),
    );
  }
}

class QabdSarafPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF357EC7),
        title: Text('قبض / صرف', style: TextStyle(fontSize: 20)),
      ),
      body: Center(child: Text('هنا صفحة قبض / صرف')),
    );
  }
}

// صفحة بيع أجل - نفس الصورة بالضبط
class AjalPage extends StatefulWidget {
  @override
  _AjalPageState createState() => _AjalPageState();
}

class _AjalPageState extends State<AjalPage> {
  bool isAjal = false;
  bool isMortaja = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF357EC7),
          title: Text('بيع أجل', style: TextStyle(fontSize: 20)),
          leading: Icon(Icons.arrow_back),
          actions: [Icon(Icons.save_outlined)],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF357EC7)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('أجل'),
                      Switch(
                        value: isAjal,
                        onChanged: (v) {
                          setState(() { isAjal = v; });
                        },
                      ),
                      Spacer(),
                      Text(
                        'المخزن الرئيسي',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                      Icon(Icons.arrow_drop_down),
                      Spacer(),
                      Checkbox(
                        value: isMortaja,
                        onChanged: (v) {
                          setState(() { isMortaja = v!; });
                        },
                      ),
                      Text('مرتجع'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_drop_down),
                      Text(
                        'محلي',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text('العميل'),
                      Expanded(
                        child: Text(
                          '2026-11-24',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  Divider(color: Colors.pink, thickness: 1),
                  Row(
                    children: [
                      Text('رقم # 1'),
                      Expanded(
                        child: Text(
                          'ملاحظات',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF357EC7), width: 2),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'إكتب اسم الصنف',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF357EC7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(Icons.add, color: Colors.white, size: 28),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('الصنف'),
                  Text('الكمية'),
                  Text('السعر'),
                  Text('الاجمالي'),
                ],
              ),
            ),
            Divider(),
            Spacer(),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Color(0xFF357EC7), width: 2)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('الخصم'),
                      Row(children: [Icon(Icons.arrow_drop_down), Text('0')]),
                      Text('الصافي'),
                      Text('0'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('الضريبة'), Text('0'), Text(''), Text('0')],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('رسوم أخرى'), Text('0'), Text('المبلغ المدفوع'), Text('0')],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text(''), Text(''), Text('المبلغ المتبقي'), Text('0')],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
