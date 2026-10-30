import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() { runApp(MohasebApp()); }

class MohasebApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'محاسب سوفت الخاص',
      home: LockScreen(),
    );
  }
}

class LockScreen extends StatefulWidget {
  @override _LockScreenState createState() => _LockScreenState();
}
class _LockScreenState extends State<LockScreen> {
  final passCtrl = TextEditingController();
  final storage = FlutterSecureStorage();
  bool isFirst = false;
  @override
  void initState(){ super.initState(); check(); }
  check() async {
    String? s = await storage.read(key: 'app_pin');
    setState(()=> isFirst = s==null);
  }
  @override Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFF1A6FB0),
      body: Center(child: Container(margin: EdgeInsets.all(20), padding: EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.lock_person, size: 80, color: Color(0xFF1A6FB0)),
          SizedBox(height: 10),
          Text(isFirst ? 'أنشئ رقم سري خاص بك' : 'محاسب سوفت - خاص', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          TextField(controller: passCtrl, obscureText: true, textAlign: TextAlign.center,
            decoration: InputDecoration(labelText: 'الرقم السري', border: OutlineInputBorder())),
          SizedBox(height: 15),
          SizedBox(width: double.infinity, child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF1A6FB0), padding: EdgeInsets.all(15)),
            onPressed: () async {
              if(passCtrl.text.length < 4) return;
              String? saved = await storage.read(key: 'app_pin');
              if(saved == null){
                await storage.write(key: 'app_pin', value: passCtrl.text);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>HomePage()));
              } else if(saved == passCtrl.text){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>HomePage()));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('الرقم خطأ!'), backgroundColor: Colors.red));
              }
            },
            child: Text(isFirst ? 'حفظ ودخول' : 'دخول', style: TextStyle(color: Colors.white)),
          )),
        ]),
      )),
    );
  }
}

class HomePage extends StatelessWidget {
  Widget topBtn(BuildContext ctx, String t, IconData ic, {bool plus=false, Widget? page}){
    return GestureDetector(onTap: (){ if(page!=null) Navigator.push(ctx, MaterialPageRoute(builder: (c)=>page)); },
      child: Container(padding: EdgeInsets.all(10), child: Column(children: [
        Stack(children: [Icon(ic, size: 50), if(plus) Positioned(right: -5, top: -5, child: Container(decoration: BoxDecoration(color: Colors.blueGrey, shape: BoxShape.circle), child: Icon(Icons.add, color: Colors.white, size: 18)))]),
        SizedBox(height: 5), Container(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5), decoration: BoxDecoration(color: Color(0xFF1565A0), borderRadius: BorderRadius.circular(20)), child: Text(t, style: TextStyle(color: Colors.white, fontSize: 14)))
      ])));
  }
  Widget menu(BuildContext ctx, String t){
    return Container(color: Color(0xFF1A6FB0), child: Column(children: [ListTile(title: Text(t, textAlign: TextAlign.right, style: TextStyle(color: Colors.white, fontSize: 18)), trailing: Icon(Icons.lock, color: Colors.white70, size: 18)), Divider(height: 1, color: Colors.white30)]));
  }
  @override Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF1A6FB0), title: Text('محاسب سوفت - نسختك الخاصة'), centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.logout), onPressed: (){ Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>LockScreen())); })]),
      body: SingleChildScrollView(child: Column(children: [
        Container(color: Colors.green[100], padding: EdgeInsets.all(8), child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.verified_user, color: Colors.green), SizedBox(width: 5), Text('التطبيق محمي ومشفر - خاص بك', style: TextStyle(color: Colors.green[800], fontWeight: FontWeight.bold))])),
        Padding(padding: EdgeInsets.all(10), child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [topBtn(context, 'قبض/صرف', Icons.handshake, page: SimplePage('سند قبض محمي')), topBtn(context, 'المبيعات', Icons.shopping_cart, plus: true, page: SimplePage('مبيعات محمية - 75,000'))]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [topBtn(context, 'الحسابات', Icons.assessment, page: SimplePage('تقارير محمية')), topBtn(context, 'المشتريات', Icons.shopping_cart_outlined, plus: true, page: SimplePage('مشتريات 850,000 - شركة التوفيق'))]),
        ])),
        menu(context, 'عمليات مخزنية'), menu(context, 'قيود يومية'), menu(context, 'أصناف'), menu(context, 'العملات'), menu(context, 'التقارير'),
        SizedBox(height: 20), Text('© تطبيق خاص - مشفر', style: TextStyle(color: Colors.grey, fontSize: 11)),
      ])),
    );
  }
}

class SimplePage extends StatelessWidget{
  final String t;
  SimplePage(this.t);
  @override Widget build(BuildContext c){ return Scaffold(appBar: AppBar(backgroundColor: Color(0xFF1E5AA8), title: Text(t)), body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.lock, size: 60, color: Colors.green), Text(t), Text('البيانات مشفرة ومحمية', style: TextStyle(color: Colors.grey))]))); }
}
