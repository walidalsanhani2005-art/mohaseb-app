import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class DatabaseHelper {
  static Database? _db;

  static Future<Database> getDb() async {
    if (_db != null) return _db!;
    String path = join(await getDatabasesPath(), 'shop.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE transactions(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            type TEXT,
            amount REAL
          )
        ''');
      },
    );
    return _db!;
  }

  static Future<void> addTransaction(String type, double amount) async {
    final db = await getDb();
    await db.insert('transactions', {'type': type, 'amount': amount});
  }

  static Future<double> getCash() async {
    final db = await getDb();
    var sales = await db.rawQuery("SELECT SUM(amount) as total FROM transactions WHERE type='sale'");
    double totalSales = (sales.first['total'] as num?)?.toDouble() ?? 0;
    var buys = await db.rawQuery("SELECT SUM(amount) as total FROM transactions WHERE type='buy'");
    double totalBuys = (buys.first['total'] as num?)?.toDouble() ?? 0;
    return 1000 + totalSales - totalBuys;
  }
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double cash = 1000;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    loadCash();
  }

  void loadCash() async {
    double c = await DatabaseHelper.getCash();
    setState(() { cash = c; });
  }

  void addSale(double price) async {
    await DatabaseHelper.addTransaction('sale', price);
    loadCash();
  }

  void addBuy(double price) async {
    await DatabaseHelper.addTransaction('buy', price);
    loadCash();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      SalesPage(onSell: addSale),
      PurchasesPage(onBuy: addBuy),
      CashPage(cash: cash),
    ];
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) { setState(() { selectedIndex = index; }); },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.sell), label: "مبيعات"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "مشتريات"),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: "الصندوق"),
        ],
      ),
    );
  }
}

class SalesPage extends StatelessWidget {
  final Function(double) onSell;
  SalesPage({required this.onSell});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("المبيعات"), backgroundColor: Colors.green),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: controller, keyboardType: TextInputType.number, decoration: InputDecoration(labelText: "سعر البيع")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double price = double.tryParse(controller.text) ?? 0;
                onSell(price);
                controller.clear();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("تم البيع وحفظه في SQL")));
              },
              child: Text("بيع"),
            ),
          ],
        ),
      ),
    );
  }
}

class PurchasesPage extends StatelessWidget {
  final Function(double) onBuy;
  PurchasesPage({required this.onBuy});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("المشتريات"), backgroundColor: Colors.red),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: controller, keyboardType: TextInputType.number, decoration: InputDecoration(labelText: "سعر الشراء")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double price = double.tryParse(controller.text) ?? 0;
                onBuy(price);
                controller.clear();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("تم الشراء وحفظه في SQL")));
              },
              child: Text("شراء"),
            ),
          ],
        ),
      ),
    );
  }
}

class CashPage extends StatelessWidget {
  final double cash;
  CashPage({required this.cash});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("الصندوق"), backgroundColor: Colors.blue),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("المبلغ الحالي في الصندوق", style: TextStyle(fontSize: 20)),
            Text("$cash", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            Text("محفوظ في SQL، حتى لو سكرت التطبيق", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
