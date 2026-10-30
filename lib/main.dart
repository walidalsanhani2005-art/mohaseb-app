import 'package:flutter/material.dart';

class SalesScreen extends StatefulWidget {
  @override
  _SalesScreenState createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  final customerCtrl = TextEditingController();
  final itemCtrl = TextEditingController();
  final qtyCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  
  List salesList = [];
  double grandTotal = 0;

  void addSale() {
    if (itemCtrl.text.isNotEmpty) {
      setState(() {
        double qty = double.tryParse(qtyCtrl.text) ?? 1;
        double price = double.tryParse(priceCtrl.text) ?? 0;
        double total = qty * price;
        salesList.add({
          "customer": customerCtrl.text,
          "item": itemCtrl.text,
          "qty": qty,
          "price": price,
          "total": total,
        });
        grandTotal += total;
        itemCtrl.clear();
        qtyCtrl.clear();
        priceCtrl.clear();
      });
    }
  }

  void saveInvoice() {
    if (salesList.isEmpty) return;
    
    // هنا يصير القيد اليومي التلقائي اللي شرحناه
    // من حساب: الصندوق / العميل
    // إلى حساب: المبيعات
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("تم حفظ فاتورة ${customerCtrl.text} - الإجمالي $grandTotal ر.ي")),
    );
    
    setState(() {
      salesList.clear();
      grandTotal = 0;
      customerCtrl.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("المبيعات"), backgroundColor: Colors.blue),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(controller: customerCtrl, decoration: InputDecoration(labelText: "اسم العميل", border: OutlineInputBorder(), prefixIcon: Icon(Icons.person))),
            SizedBox(height: 8),
            TextField(controller: itemCtrl, decoration: InputDecoration(labelText: "اسم الصنف", border: OutlineInputBorder(), prefixIcon: Icon(Icons.inventory))),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: TextField(controller: qtyCtrl, keyboardType: TextInputType.number, decoration: InputDecoration(labelText: "العدد", border: OutlineInputBorder()))),
                SizedBox(width: 8),
                Expanded(child: TextField(controller: priceCtrl, keyboardType: TextInputType.number, decoration: InputDecoration(labelText: "السعر", border: OutlineInputBorder()))),
              ],
            ),
            SizedBox(height: 12),
            ElevatedButton(onPressed: addSale, child: Text("إضافة صنف"), style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 45))),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              color: Colors.blue.shade50,
              child: Text("الإجمالي: $grandTotal ر.ي", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: salesList.length,
                itemBuilder: (context, i) {
                  return Card(child: ListTile(title: Text(salesList[i]['item']), subtitle: Text("العدد: ${salesList[i]['qty']} × ${salesList[i]['price']}"), trailing: Text("${salesList[i]['total']}")));
                },
              ),
            ),
            ElevatedButton(
              onPressed: saveInvoice,
              child: Text("حفظ الفاتورة ✅", style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50), backgroundColor: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
