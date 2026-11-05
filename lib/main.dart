import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Directionality(
      textDirection: TextDirection.rtl,
      child: HomePage(),
    ),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("المبيعات"), backgroundColor: Colors.red),
      body: Center(child: Text("قائمة المبيعات")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BieAjelPage()),
          );
        },
      ),
    );
  }
}

class BieAjelPage extends StatefulWidget {
  @override
  _BieAjelPageState createState() => _BieAjelPageState();
}

class _BieAjelPageState extends State<BieAjelPage> {
  bool isAjel = false;
  bool isMortaja = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("بيع آجل"),
        backgroundColor: Colors.blue[800],
        actions: [IconButton(icon: Icon(Icons.save), onPressed: () {})],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Text("آجل"),
                Switch(value: isAjel, onChanged: (v) => setState(() => isAjel = v)),
                Expanded(child: Center(child: Text("المخزن الرئيسي"))),
                Checkbox(value: isMortaja, onChanged: (v) => setState(() => isMortaja = v!)),
                Text("مرتجع"),
              ],
            ),
          ),
          Center(child: Text("محلي")),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Expanded(child: TextField(decoration: InputDecoration(labelText: "العميل"))),
                SizedBox(width: 10),
                Text("2026-11-06"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Expanded(child: TextField(decoration: InputDecoration(labelText: "ملاحظات"))),
                Text("رقم# 1"),
              ],
            ),
          ),
          Divider(thickness: 2, color: Colors.blue),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
            child: Row(
              children: [
                IconButton(icon: Icon(Icons.add_circle, color: Colors.blue, size: 30), onPressed: () {}),
                Expanded(child: TextField(decoration: InputDecoration(hintText: "إكتب اسم الصنف", border: InputBorder.none))),
              ],
            ),
          ),
          Container(
            color: Colors.grey[100],
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Text("الصنف"), Text("الكمية"), Text("السعر"), Text("الاجمالي")],
            ),
          ),
          Expanded(child: Container()),
          Divider(thickness: 2, color: Colors.blue),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("الخصم"), Text("0")]),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("الضريبة"), Text("0")]),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("رسوم أخرى"), Text("0")]),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("المبلغ المدفوع"), Text("0")]),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("الصافي"), Text("0")]),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("المبلغ المتبقي"), Text("0")]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
