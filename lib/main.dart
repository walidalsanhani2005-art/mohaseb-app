import 'package:flutter/material.dart';

void main() { runApp(MohasebApp()); }

class MohasebApp extends StatelessWidget {
  @override Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, title: 'محاسب سوفت', theme: ThemeData(fontFamily: 'Cairo'), home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  Widget buildTopButton(BuildContext context, String title, IconData icon, {bool hasPlus=false, Widget? page}){
    return GestureDetector(onTap: (){ if(page!=null) Navigator.push(context, MaterialPageRoute(builder: (c)=>page)); },
      child: Container(padding: EdgeInsets.all(10), child: Column(children: [
        Stack(children: [Icon(icon, size: 50), if(hasPlus) Positioned(right: -5, top: -5, child: Container(decoration: BoxDecoration(color: Colors.blueGrey, shape: BoxShape.circle), child: Icon(Icons.add, color: Colors.white, size: 18)))]),
        SizedBox(height: 5), Container(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5), decoration: BoxDecoration(color: Color(0xFF1565A0), borderRadius: BorderRadius.circular(20)), child: Text(title, style: TextStyle(color: Colors.white, fontSize: 14)))
      ])));
  }
  Widget buildMenuItem(BuildContext context, String title){
    Widget? page;
    if(title=='أصناف') page = ItemsPage();
    if(title=='قبض/صرف') page = VoucherPage();
    if(title=='قيود يومية') page = JournalPage();
    if(title=='التقارير') page = ReportsPage();
    if(title=='قيود وحسابات') page = JournalPage();
    return GestureDetector(onTap: (){ if(page!=null) Navigator.push(context, MaterialPageRoute(builder: (c)=>page!)); },
      child: Container(color: Color(0xFF1A6FB0), child: Column(children: [ListTile(title: Text(title, textAlign: TextAlign.right, style: TextStyle(color: Colors.white, fontSize: 18)), trailing: Icon(Icons.keyboard_arrow_down, color: Colors.white)), Divider(height: 1, color: Colors.white30)])));
  }
  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Color(0xFF1A6FB0), title: Text('محاسب سوفت'), centerTitle: true),
      body: SingleChildScrollView(child: Column(children: [
        Padding(padding: EdgeInsets.all(10), child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [buildTopButton(context, 'قبض/صرف', Icons.handshake, page: VoucherPage()), buildTopButton(context, 'المبيعات', Icons.shopping_cart, hasPlus: true, page: SalesPage())]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [buildTopButton(context, 'الحسابات', Icons.assessment, page: ReportsPage()), buildTopButton(context, 'المشتريات', Icons.shopping_cart_outlined, hasPlus: true, page: PurchasePage())]),
        ])),
        buildMenuItem(context, 'عمليات مخزنية'), buildMenuItem(context, 'قيود يومية'), buildMenuItem(context, 'قيود وحسابات'), buildMenuItem(context, 'أصناف'), buildMenuItem(context, 'العملات'), buildMenuItem(context, 'التقارير'),
      ])),
    );
  }
}

// ===== الصفحات المختصرة =====
class SalesPage extends StatefulWidget{ @override _SalesPageState createState()=>_SalesPageState(); }
class _SalesPageState extends State<SalesPage>{
  List items=[{'name':'بطارية 100 أمبير','qty':1,'price':25000,'total':25000},{'name':'لوح شمسي 100 وات','qty':2,'price':25000,'total':50000}];
  @override Widget build(BuildContext context){ 
    return Scaffold(appBar: AppBar(backgroundColor: Color(0xFF1E5AA8), title: Text('بيع نقدي')), 
    body: Column(children:[Container(margin: EdgeInsets.all(6), padding: EdgeInsets.all(10), decoration: BoxDecoration(border: Border.all(color: Color(0xFF1E5AA8), width: 2), borderRadius: BorderRadius.circular(8)), child: Column(children:[Text('العميل: عبدالله سعيد - التاريخ: 2018-12-02', style: TextStyle(fontWeight: FontWeight.bold))])), Expanded(child: ListView.builder(itemCount: items.length, itemBuilder: (c,i)=>ListTile(title: Text(items[i]['name']), trailing: Text('${items[i]['total']}')))), Container(padding: EdgeInsets.all(15), color: Color(0xFF1E5AA8), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children:[Text('الإجمالي: 75000', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), Text('2 صنف', style: TextStyle(color: Colors.white))]))]); 
  }
}
class PurchasePage extends StatelessWidget{ @override Widget build(BuildContext c){ return Scaffold(appBar: AppBar(backgroundColor: Color(0xFF1E5AA8), title: Text('شراء آجل')), body: Center(child: Text('شركة التوفيق - 850,000 ر.ي - 3 أصناف'))); } }
class ItemsPage extends StatelessWidget{ @override Widget build(BuildContext c){ return Scaffold(appBar: AppBar(backgroundColor: Color(0xFF1E5AA8), title: Text('أصناف')), body: Center(child: Text('لوح شمسي 150 وات - بطاريات 100 - لوح 100'))); } }
class VoucherPage extends StatelessWidget{ @override Widget build(BuildContext c){ return Scaffold(appBar: AppBar(backgroundColor: Color(0xFF1E5AA8), title: Text('سند قبض')), body: Center(child: Text('عبدالله سعيد - 50,000 - جزء من الحساب'))); } }
class JournalPage extends StatelessWidget{ @override Widget build(BuildContext c){ return Scaffold(appBar: AppBar(backgroundColor: Color(0xFF1E5AA8), title: Text('قيود يومية')), body: Center(child: Text('100,000 مدين = 100,000 دائن - متوازن'))); } }

// ===== صفحة التقارير - نفس الصورة =====
class ReportsPage extends StatelessWidget {
  final reports = [
    'حركة الأصناف',
    'أرصدة الحسابات',
    'قائمة الدخل',
    'أرباح الأصناف',
    'العمليات اليومية',
    'القيود اليومية',
    'ميزان المراجعة',
    'المركز المالي',
    'حركة الصندوق',
    'رأس المال العامل',
  ];

  Widget buildReportItem(String title) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom
