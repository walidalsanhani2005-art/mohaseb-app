import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'محاسب متكامل',
      theme: ThemeData(primarySwatch: Colors.teal, useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  Database? db;
  List<Map> products = [];
  List<Map> sales = [];
  List<Map> debts = [];
  List<Map> expenses = [];
  double cash = 0, totalSales = 0, totalBuy = 0, totalExp = 0;

  final itemC = TextEditingController();
  final qtyC = TextEditingController();
  final custC = TextEditingController();
  final priceC = TextEditingController();
  final expNameC = TextEditingController();
  final expAmountC = TextEditingController();

  @override
  void initState() { super.initState(); _init(); }

  Future<void> _init() async {
    db = await openDatabase(join(await getDatabasesPath(), 'full.db'), version: 1,
      onCreate: (d, v) async {
        await d.execute('CREATE TABLE products(id INTEGER PRIMARY KEY, name TEXT, qty INTEGER, price REAL)');
        await d.execute('CREATE TABLE sales(id INTEGER PRIMARY KEY, item TEXT, qty INTEGER, customer TEXT, total REAL, type TEXT, date TEXT, paid INTEGER)');
        await d.execute('CREATE TABLE expenses(id INTEGER PRIMARY KEY, name TEXT, amount REAL, date TEXT)');
      });
    _load();
  }

  Future<void> _load() async {
    products
