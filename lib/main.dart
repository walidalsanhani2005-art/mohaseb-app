import 'package:flutter/material.dart';
void main()=>runApp(const MohasebApp());
class MohasebApp extends StatelessWidget{const MohasebApp({super.key});@override Widget build(BuildContext c)=>const MaterialApp(debugShowCheckedModeBanner:false,home:HomeScreen());}
class HomeScreen extends StatefulWidget{const HomeScreen({super.key});@override State<HomeScreen> createState()=>_HomeScreenState();}
class _HomeScreenState extends State<HomeScreen>{
bool o1=false,o2=false,o3=false,o4=true,o5=true;
@override Widget build(BuildContext context){
return Scaffold(backgroundColor:const Color(0xFFF5F5F5),
appBar:AppBar(backgroundColor:const Color(0xFF1E5AA8),foregroundColor:Colors.white,title:const Text('محاسب سوفت',style:TextStyle(fontWeight:FontWeight.bold))),
body:ListView(children:[
Container(color:Colors.white,padding:const EdgeInsets.symmetric(vertical:20,horizontal:10),child:Column(children:[
Row(mainAxisAlignment:MainAxisAlignment.spaceAround,children:[_top('المبيعات'),_top('قبض/صرف')]),
const SizedBox(height:18),
Row(mainAxisAlignment:MainAxisAlignment.spaceAround,children:[_top('المشتريات'),_top('الحسابات')]),
])),
const SizedBox(height:8),
_bar('عمليات مخزنية',o1,()=>setState(()=>o1=!o1)),if(o1)...['صرف مخزني','توريد مخزني','تحويل مخزني','تسوية مخزنية','إضافة مخزن','جرد مخزني'].map(_it),
_bar('قيود وحسابات',o2,()=>setState(()=>o2=!o2)),if(o2)...['قيد يومي','قيد إفتتاحي','إضافة حساب','حركة الصندوق','دليل الحسابات','إقفال سنوي'].map(_it),
_bar('أصناف',o3,()=>setState(()=>o3=!o3)),if(o3)...['الأصناف','أسعار البيع','وحدات الصنف','فاتورة عرض سعر','طلب شراء'].map(_it),
_bar('العملات',o4,()=>setState(()=>o4=!o4)),if(o4)...['إضافة عملة','سعر العملات','سقف الحساب'].map(_it),
_bar('التقارير',o5,()=>setState(()=>o5=!o5)),if(o5)...['حركة الأصناف','ميزان المراجعة','قائمة الدخل','المركز المالي','تقارير أخرى'].map(_it),
]),
bottomNavigationBar:Container(height:55,color:const Color(0xFF1E5AA8),child:const Center(child:Text('المخزن الرئيسي',style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold)))),
);
}
Widget _top(String t)=>Column(children:[Container(width:90,height:70,decoration:BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(10),border:Border.all(color:const Color(0xFFEEEEEE))),child:const Icon(Icons.shopping_cart,size:38,color:Color(0xFF1E5AA8))),const SizedBox(height:8),Container(padding:const EdgeInsets.symmetric(horizontal:16,vertical:5),decoration:BoxDecoration(color:const Color(0xFF1E5AA8),borderRadius:BorderRadius.circular(20)),child:Text(t,style:const TextStyle(color:Colors.white,fontSize:12,fontWeight:FontWeight.bold)))]);
Widget _bar(String t,bool o,VoidCallback f)=>InkWell(onTap:f,child:Container(color:const Color(0xFF1E5AA8),padding:const EdgeInsets.symmetric(vertical:12,horizontal:14),margin:const EdgeInsets.only(top:1),child:Row(children:[Icon(o?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down,color:Colors.white,size:22),const Spacer(),Text(t,style:const TextStyle(color:Colors.white,fontWeight:FontWeight.bold,fontSize:14))]))); 
Widget _it(String t)=>Container(color:Colors.white,padding:const EdgeInsets.symmetric(vertical:14,horizontal:18),decoration:const BoxDecoration(border:Border(bottom:BorderSide(color:Color(0xFFE8E8E8),width:1))),child:Row(children:[const Spacer(),Text(t,style:const TextStyle(fontSize:14))]));
}
