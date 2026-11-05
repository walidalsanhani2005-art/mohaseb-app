import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// ================= الصفحة الرئيسية =================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _open(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1976D2),
        leading: const Icon(Icons.menu, color: Colors.white),
        title: const Text('محاسب سوفت', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19)),
        centerTitle: true,
        actions: const [
          Icon(Icons.notifications_none, color: Colors.white),
          SizedBox(width: 14),
          Icon(Icons.share, color: Colors.white),
          SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(children: [
                Expanded(child: _cardBlue(context, 'المبيعات', const Color(0xFF1976D2), () => _open(context, const SalesListPage()))),
                const SizedBox(width: 8),
                Expanded(child: _cardNormal(context, 'قبض / صرف', Icons.swap_horiz, () => _open(context, const CashListPage()))),
              ]),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(children: [
                Expanded(child: _cardBlue(context, 'المشتريات', const Color(0xFF2E9E4F), () => _open(context, const PurchasesListPage()))),
                const SizedBox(width: 8),
                Expanded(child: _cardNormal(context, 'الحسابات', Icons.person_outline, () => _open(context, const AccountsPage()))),
              ]),
            ),
            const SizedBox(height: 8),
            _tile('عمليات مخزنية'),
            _tile('قيود وحسابات'),
            _tile('أصناف'),
            _tile('العملات'),
            _tile('التقارير'),
            const SizedBox(height: 70),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color(0xFF1976D2),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.sync, color: Colors.white),
            Text('المخزن الرئيسي', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
            CircleAvatar(radius: 16, backgroundColor: Colors.red, child: Icon(Icons.play_arrow, color: Colors.white, size: 18)),
          ],
        ),
      ),
    );
  }

  Widget _cardBlue(BuildContext context, String title, Color c, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6), border: Border(right: BorderSide(color: c, width: 5))),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          CircleAvatar(radius: 15, backgroundColor: c, child: const Icon(Icons.add, color: Colors.white, size: 20)),
        ]),
      ),
    );
  }

  Widget _cardNormal(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Icon(icon, color: Colors.black54),
        ]),
      ),
    );
  }

  Widget _tile(String title) {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 6),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: ExpansionTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        children: const [ListTile(title: Text('القائمة هنا...'))],
      ),
    );
  }
}

// ================= قائمة المبيعات =================
class SalesListPage extends StatelessWidget {
  const SalesListPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1976D2),
        title: const Text('المبيعات', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [IconButton(icon: const Icon(Icons.add), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SaleFormPage(title: 'بيع آجل', color: Color(0xFF1976D2))))))],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10),
            child: Row(children: [
              Expanded(child: TextField(decoration: InputDecoration(hintText: 'بحث...', prefixIcon: const Icon(Icons.search), border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))))),
              const SizedBox(width: 8),
              const Icon(Icons.filter_list, color: Colors.blue),
            ]),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (_, i) => Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text('فاتورة مبيعات ${i + 1}'),
                  subtitle: const Text('زبون - 2026-11-06'),
                  trailing: const Text('5000', style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SaleFormPage(title: 'بيع آجل', color: Color(0xFF1976D2)))),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF1976D2),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SaleFormPage(title: 'بيع آجل', color: Color(0xFF1976D2)))),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

// ================= نموذج بيع آجل =================
class SaleFormPage extends StatefulWidget {
  final String title;
  final Color color;
  const SaleFormPage({super.key, required this.title, required this.color});
  @override
  State<SaleFormPage> createState() => _SaleFormPageState();
}

class _SaleFormPageState extends State<SaleFormPage> {
  List<Map<String, String>> items = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: const [Icon(Icons.picture_as_pdf, color: Colors.red), SizedBox(width: 8), Icon(Icons.check, color: Colors.white), SizedBox(width: 10)],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          _field('رقم الفاتورة', '1'),
          _field('التاريخ', '2026-11-06'),
          _field('الزبون', 'اختر الزبون...'),
          _field('البيان', 'اكتب البيان...'),
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text('الأصناف', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ElevatedButton.icon(onPressed: _showItemDialog, icon: const Icon(Icons.add), label: const Text('إضافة صنف')),
          ]),
          const SizedBox(height: 8),
          ...items.map((e) => Card(child: ListTile(title: Text(e['name'] ?? ''), subtitle: Text('الكمية: ${e['qty']} - السعر: ${e['price']}'), trailing: Text(e['total'] ?? '')))),
          if (items.isEmpty) const Text('لا توجد أصناف بعد - اضغط إضافة صنف'),
          const SizedBox(height: 20),
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Navigator.pop(context), style: ElevatedButton.styleFrom(backgroundColor: widget.color, padding: const EdgeInsets.all(14)), child: const Text('حفظ', style: TextStyle(color: Colors.white, fontSize: 18)))),
        ]),
      ),
    );
  }

  Widget _field(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextField(decoration: InputDecoration(labelText: label, hintText: hint, border: const OutlineInputBorder(), filled: true, fillColor: Colors.white)),
    );
  }

  void _showItemDialog() {
    final name = TextEditingController();
    final qty = TextEditingController(text: '1');
    final price = TextEditingController(text: '0');
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('إضافة صنف'),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          TextField(controller: name, decoration: const InputDecoration(labelText: 'اسم الصنف')),
          TextField(controller: qty, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'الكمية')),
          TextField(controller: price, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'السعر')),
        ]),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('إلغاء')),
          ElevatedButton(
            onPressed: () {
              final q = double.tryParse(qty.text) ?? 1;
              final p = double.tryParse(price.text) ?? 0;
              setState(() => items.add({'name': name.text.isEmpty ? 'صنف جديد' : name.text, 'qty': qty.text, 'price': price.text, 'total': (q * p).toString()}));
              Navigator.pop(context);
            },
            child: const Text('إضافة'),
          ),
        ],
      ),
    );
  }
}

// ================= المشتريات =================
class PurchasesListPage extends StatelessWidget {
  const PurchasesListPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFF2E9E4F), title: const Text('المشتريات', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), centerTitle: true, iconTheme: const IconThemeData(color: Colors.white)),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('قائمة المشتريات', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2E9E4F)),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SaleFormPage(title: 'شراء آجل', color: Color(0xFF2E9E4F)))),
            child: const Text('شراء آجل +', style: TextStyle(color: Colors.white)),
          ),
        ]),
      ),
    );
  }
}

// ================= قبض / صرف =================
class CashListPage extends StatelessWidget {
  const CashListPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFF1976D2), title: const Text('قبض / صرف', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), centerTitle: true, iconTheme: const IconThemeData(color: Colors.white)),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CashFormPage(title: 'سند قبض'))), child: const Text('سند قبض +')),
          const SizedBox(height: 12),
          ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CashFormPage(title: 'سند صرف'))), child: const Text('سند صرف +')),
        ]),
      ),
    );
  }
}

class CashFormPage extends StatefulWidget {
  final String title;
  const CashFormPage({super.key, required this.title});
  @override
  State<CashFormPage> createState() => _CashFormPageState();
}

class _CashFormPageState extends State<CashFormPage> {
  List<Map<String, String>> rows = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFF1976D2), title: Text(widget.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), centerTitle: true, iconTheme: const IconThemeData(color: Colors.white), actions: const [Icon(Icons.check, color: Colors.white), SizedBox(width: 10)]),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          TextField(decoration: const InputDecoration(labelText: 'الصندوق', border: OutlineInputBorder())),
          const SizedBox(height: 8),
          TextField(decoration: const InputDecoration(labelText: 'البيان', border: OutlineInputBorder())),
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('القيد', style: TextStyle(fontWeight: FontWeight.bold)), ElevatedButton.icon(onPressed: _showCashDialog, icon: const Icon(Icons.add), label: const Text('إضافة'))]),
          ...rows.map((e) => Card(child: ListTile(title: Text(e['name'] ?? ''), trailing: Text(e['amount'] ?? '')))),
          const SizedBox(height: 16),
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('حفظ'))),
        ]),
      ),
    );
  }

  void _showCashDialog() {
    final name = TextEditingController();
    final amount = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('إضافة حساب'),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          TextField(controller: name, decoration: const InputDecoration(labelText: 'اسم الحساب')),
          TextField(controller: amount, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'المبلغ')),
        ]),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('إلغاء')),
          ElevatedButton(onPressed: () { setState(() => rows.add({'name': name.text, 'amount': amount.text})); Navigator.pop(context); }, child: const Text('إضافة')),
        ],
      ),
    );
  }
}

// ================= الحسابات =================
class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFF1976D2), title: const Text('الحسابات', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), centerTitle: true, iconTheme: const IconThemeData(color: Colors.white)),
      body: const Center(child: Text('صفحة الحسابات', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
    );
  }
}
