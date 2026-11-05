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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1976D2),
        leading: const Icon(Icons.menu, color: Colors.white),
        title: const Text('محاسب سوفت',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19)),
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
                Expanded(child: _cardBlue('المبيعات', const Color(0xFF1976D2), true)),
                const SizedBox(width: 8),
                Expanded(child: _cardNormal('قبض / صرف', Icons.swap_horiz)),
              ]),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(children: [
                Expanded(child: _cardBlue('المشتريات', const Color(0xFF2E9E4F), true)),
                const SizedBox(width: 8),
                Expanded(child: _cardNormal('الحسابات', Icons.person_outline)),
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
            Text('المخزن الرئيسي',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
            CircleAvatar(
                radius: 16,
                backgroundColor: Colors.red,
                child: Icon(Icons.play_arrow, color: Colors.white, size: 18)),
          ],
        ),
      ),
    );
  }

  Widget _cardBlue(String title, Color c, bool hasPlus) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border(right: BorderSide(color: c, width: 5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          CircleAvatar(radius: 15, backgroundColor: c, child: const Icon(Icons.add, color: Colors.white, size: 20)),
        ],
      ),
    );
  }

  Widget _cardNormal(String title, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Icon(icon, color: Colors.black54),
        ],
      ),
    );
  }

  Widget _tile(String title) {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 6),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: ExpansionTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        children: const [ListTile(title: Text('...'))],
      ),
    );
  }
}
