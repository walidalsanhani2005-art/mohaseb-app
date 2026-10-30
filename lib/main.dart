import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MohasebApp()));

class MohasebApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('المحاسب - نسخة كاملة'), backgroundColor: Color(0xFF2C5FAA)),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          GridView.count(
            crossAxisCount: 2, shrinkWrap: true, physics: NeverScrollableScrollPhysics(), childAspectRatio: 1.2,
            children: [
              _mainBox(context, 'المبيعات', Icons.point_of_sale, Colors.red),
              _mainBox(context, 'قبض - صرف', Icons.swap_horiz, Colors.blue),
              _mainBox(context, 'المشتريات', Icons.shopping_bag, Colors.green),
              _mainBox(context, 'الحسابات', Icons.account_balance, Colors.purple),
            ],
          ),
          _section(context, 'عمليات مخزنية', [
            'صرف مخزني','توريد مخزني','تحويل مخزني','تسعير','جرد مخزني','تالف'
          ]),
          _section(context, 'قيود وحسابات', [
            'سند قبض','سند صرف','قيد يومي','إشعار دائن','إشعار مدين','تقرير القيود'
          ]),
          _section(context, 'أصناف', [
            'إضافة صنف','بحث صنف','مجموعات الأصناف','وحدات الأصناف','طباعة باركود'
          ]),
          _section(context, 'العملات', [
            'إضافة عملة','سعر العملات','صرف العملات'
          ], open: true),
          _section(context, 'التقارير', [
            'حركة الأصناف','كشف حساب','ميزان مراجعة','أرباح وخسائر','تقرير المبيعات','تقرير المشتريات'
          ], open: true),
        ],
      ),
    );
  }

  Widget _mainBox(BuildContext ctx, String title, IconData icon, Color c) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () => Navigator.push(ctx, MaterialPageRoute(builder: (_) => GenericPage(title: title, color: c, icon: icon))),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon, size: 45, color: c), SizedBox(height: 8),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))
        ]),
      ),
    );
  }

  Widget _section(BuildContext ctx, String secTitle, List<String> items, {bool open = false}) {
    return Card(
      margin: EdgeInsets.only(top: 8),
      child: ExpansionTile(
        initiallyExpanded: open,
        title: Text(secTitle, style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2C5FAA))),
        children: items.map((item) => ListTile(
          title: Text(item),
          leading: Icon(Icons.arrow_left, color: Colors.grey),
          onTap: () => Navigator.push(ctx, MaterialPageRoute(builder: (_) => GenericPage(title: item, color: Color(0xFF2C5FAA), icon: Icons.list))),
        )).toList(),
      ),
    );
  }
}

// صفحة واحدة ذكية تشتغل لكل الأزرار
class GenericPage extends StatefulWidget {
  final String title; final Color color; final IconData icon;
  GenericPage({required this.title, required this.color, required this.icon});
  @override _GenericPageState createState() => _GenericPageState();
}

class _GenericPageState extends State<GenericPage> {
  List<Map<String,String>> records = [];

  void _addRecord() {
    String name = ''; String amount = '';
    showDialog(context: context, builder: (_) => AlertDialog(
      title: Text('إضافة ${widget.title}'),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        TextField(decoration: InputDecoration(labelText: 'الاسم / البيان'), onChanged: (v)=>name=v),
        TextField(decoration: InputDecoration(labelText: 'المبلغ / الكمية'), keyboardType: TextInputType.number, onChanged: (v)=>amount=v),
      ]),
      actions: [
        TextButton(onPressed: (){
          if(name.isNotEmpty){
            setState(()=>records.add({'name':name,'amount':amount.isEmpty?'---':amount,'date':DateTime.now().toString().substring(0,16)}));
          }
          Navigator.pop(context);
        }, child: Text('حفظ'))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), backgroundColor: widget.color),
      body: records.isEmpty 
      ? Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(widget.icon, size: 80, color: Colors.grey[300]),
          SizedBox(height: 15),
          Text('لا يوجد بيانات في ${widget.title}', style: TextStyle(color: Colors.grey)),
          SizedBox(height: 10),
          Text('اضغط + للإضافة', style: TextStyle(color: Colors.grey, fontSize: 12)),
        ]))
      : ListView.builder(
          itemCount: records.length,
          itemBuilder: (_, i) => Card(
            child: ListTile(
              leading: CircleAvatar(backgroundColor: widget.color, child: Text('${i+1}', style: TextStyle(color: Colors.white))),
              title: Text(records[i]['name']!),
              subtitle: Text(records[i]['date']!),
              trailing: Text(records[i]['amount']!, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: widget.color,
        onPressed: _addRecord,
        child: Icon(Icons.add),
      ),
    );
  }
}
