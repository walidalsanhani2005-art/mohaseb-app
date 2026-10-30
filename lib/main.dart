import 'package:flutter/material.dart';

void main() {
  runApp(const MohasebApp());
}

class MohasebApp extends StatelessWidget {
  const MohasebApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool s1 = false;
  bool s2 = false;
  bool s3 = false;
  bool s4 = true;
  bool s5 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E5AA8),
        foregroundColor: Colors.white,
        title: const Text('محاسب سوفت', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [topItem('المبيعات'), topItem('قبض/صرف')],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [topItem('المشتريات'), topItem('الحسابات')],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          bar('عمليات مخزنية', s1, (){setState(()=>s1=!s1);}),
          if(s1) item('صرف مخزني'),
          if(s1) item('توريد مخزني'),
          if(s1) item('تحويل مخزني'),
          if(s1) item('تسوية مخزنية'),
          if(s1) item('إضافة مخزن'),
          if(s1) item('جرد مخزني'),

          bar('قيود وحسابات', s2, (){setState(()=>s2=!s2);}),
          if(s2) item('قيد يومي'),
          if(s2) item('قيد إفتتاحي'),
          if(s2) item('إضافة حساب'),
          if(s2) item('حركة الصندوق'),
          if(s2) item('دليل الحسابات'),
          if(s2) item('إقفال سنوي'),

          bar('أصناف', s3, (){setState(()=>s3=!s3);}),
          if(s3) item('الأصناف'),
          if(s3) item('أسعار البيع'),
          if(s3) item('وحدات الصنف'),
          if(s3) item('فاتورة عرض سعر'),
          if(s3) item('طلب شراء'),

          bar('العملات', s4, (){setState(()=>s4=!s4);}),
          if(s4) item('إضافة عملة'),
          if(s4) item('سعر العملات'),
          if(s4) item('سقف الحساب'),

          bar('التقارير', s5, (){setState(()=>s5=!s5);}),
          if(s5) item('حركة الأصناف'),
          if(s5) item('ميزان المراجعة'),
          if(s5) item('قائمة الدخل'),
          if(s5) item('المركز المالي'),
          if(s5) item('تقارير أخرى'),
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: const Color(0xFF1E5AA8),
        child: const Center(child: Text('المخزن الرئيسي', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      ),
    );
  }

  Widget topItem(String t){
    return Column(
      children:[
        Container(width:80,height:65,decoration:BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(8),border:Border.all(color:const Color(0xFFEEEEEE))),child:const Icon(Icons.shopping_cart,size:36,color:Color(0xFF1E5AA8))),
        const SizedBox(height:6),
        Container(padding:const EdgeInsets.symmetric(horizontal:14,vertical:4),decoration:BoxDecoration(color:const Color(0xFF1E5AA8),borderRadius:BorderRadius.circular(20)),child:Text(t,style:const TextStyle(color:Colors.white,fontSize:11))),
      ],
    );
  }

  Widget bar(String t,bool open,VoidCallback tap){
    return InkWell(
      onTap:tap,
      child:Container(
        color:const Color(0xFF1E5AA8),
        padding:const EdgeInsets.symmetric(vertical:12,horizontal:14),
        margin:const EdgeInsets.only(top:1),
        child:Row(children:[Icon(open?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down,color:Colors.white),const Spacer(),Text(t,style:const TextStyle(color:Colors.white,fontWeight:FontWeight.bold))]),
      ),
    );
  }

  Widget item(String t){
    return Container(
      color:Colors.white,
      padding:const EdgeInsets.symmetric(vertical:13,horizontal:16),
      decoration:const BoxDecoration(border:Border(bottom:BorderSide(color:Color(0xFFE8E8E8)))),
      child:Row(children:[const Spacer(),Text(t)]),
    );
  }
}
