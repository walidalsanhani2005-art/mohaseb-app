import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'المخزن',
      theme: ThemeData(primaryColor: const Color(0xFF1976D2)),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget _cardBlue(String title, Color c) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            CircleAvatar(radius: 15, backgroundColor: c, child: const Icon(Icons.arrow_back, size: 14, color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _cardNormal(String title, IconData icon) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Icon(icon, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _tile(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 15)),
          const Icon(Icons.chevron_left, color: Colors.grey),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1976D2),
        title: const Row(
          children: [
            Icon(Icons.menu, color: Colors.white),
            SizedBox(width: 10),
            Text('محاسب سوق', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            Spacer(),
            Icon(Icons.notifications_none, color: Colors.white),
            SizedBox(width: 14),
            Icon(Icons.person, color: Colors.white),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(child: _cardBlue('المبيعات', const Color(0xFF1976D2))),
                  const SizedBox(width: 8),
                  Expanded(child: _cardNormal('صرف / قبض', Icons.swap_horiz)),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(child: _cardBlue('المشتريات', const Color(0xFF2E9E4F))),
                  const SizedBox(width: 8),
                  Expanded(child: _cardNormal('الحسابات', Icons.person_outline)),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Text('عمليات مخزنية', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _tile('عمليات مخزنية'),
            _tile('حسابات وقيود'),
            _tile('أصول'),
            _tile('العملات'),
            _tile('الباركود'),
            const SizedBox(height: 70),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color(0xFF1976D2),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.sync, color: Colors.white),
            Text('المخزن الرئيسي', style: TextStyle(color: Colors.white, fontSize: 16)),
            CircleAvatar(radius: 16, backgroundColor: Colors.red),
          ],
        ),
      ),
    );
  }
}
