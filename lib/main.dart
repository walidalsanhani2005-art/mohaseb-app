import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// الصفحة الرئيسية
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("الفواتير"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text("لا توجد فواتير بعد"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InvoicePage(),
            ),
          );
        },
      ),
    );
  }
}

// صفحة الفاتورة
class InvoicePage extends StatefulWidget {
  @override
  _InvoicePageState createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  TextEditingController customerController = TextEditingController();
  TextEditingController productController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  double total = 0;

  void calculateTotal() {
    double price = double.tryParse(priceController.text) ?? 0;
    double quantity = double.tryParse(quantityController.text) ?? 0;
    setState(() {
      total = price * quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("فاتورة جديدة"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: customerController,
              decoration: InputDecoration(labelText: "اسم العميل"),
            ),
            TextField(
              controller: productController,
              decoration: InputDecoration(labelText: "اسم المنتج"),
            ),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "السعر"),
              onChanged: (value) => calculateTotal(),
            ),
            TextField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "الكمية"),
              onChanged: (value) => calculateTotal(),
            ),
            SizedBox(height: 20),
            Text("الإجمالي: $total", style: TextStyle(fontSize: 22)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("تم حفظ الفاتورة بنجاح")),
                );
                Navigator.pop(context);
              },
              child: Text("حفظ الفاتورة"),
            ),
          ],
        ),
      ),
    );
  }
}
