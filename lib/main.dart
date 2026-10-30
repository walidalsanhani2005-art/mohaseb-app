import 'package:flutter/material.dart';
void main()=>runApp(const MohasebApp());
class MohasebApp extends StatelessWidget{const MohasebApp({super.key});@override Widget build(BuildContext c)=>const MaterialApp(debugShowCheckedModeBanner:false,home:HomeScreen());}
class HomeScreen extends StatefulWidget{const HomeScreen({super.key});@override State<HomeScreen> createState()=>_HomeScreenState();}
class _HomeScreenState extends State<HomeScreen>{
bool cur=true,rep=true;
@override Widget build(BuildContext context){
return Scaffold(backgroundColor:const Color(0xFFF5F5F5),
appBar:AppBar(backgroundColor:const Color(0xFF1E5AA8),foregroundColor:Colors.white,title:const Text('محاسب سوفت',style:TextStyle(fontWeight:FontWeight.bold)),leading:const Icon(Icons.menu),actions:const [Icon(Icons.notifications_none),SizedBox(width:12),Icon(Icons.share),SizedBox(width:10)]),
body:ListView(children:[
// صور المبيعات والمشتريات
Container(color:Colors.white,padding:const EdgeInsets.symmetric(vertical:20,horizontal:12),child:Column(children:[
Row(mainAxisAlignment:MainAxisAlignment.spaceAround,children:[_top(Icons.point_of_sale,'المبيعات'),_top(Icons.receipt_long,'قبض/صرف')]),
const SizedBox(height:18),
Row(mainAxisAlignment:MainAxisAlignment.spaceAround,children:[_top(Icons.shopping_bag,'المشتريات'),_top(Icons.account_balance_wallet,'الحسابات')]),
])),
const SizedBox(height:8),
_bar('العملات',cur,()=>setState(()=>cur=!cur)),
if(cur)...['إضافة عملة','سعر العملات','سقف الحساب'].map(_it),
_bar('التقارير',rep,()=>setState(()=>rep=!rep)),
if(rep)...['حركة الأصناف','ميزان المراجعة','قائمة الدخل','المركز المالي','تقارير أخرى'].map(_it),
]),
bottomNavigationBar:Container(height:55,color:const Color(0xFF1E5AA8),padding:const EdgeInsets.symmetric(horizontal:14),child:const Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[Row(children:[Icon(Icons.play_circle_fill,color:Colors.white,size:20),SizedBox(width:4),Text('You\nTube',style:TextStyle(color:Colors.white,fontSize:9))]),Text('المخزن الرئيسي',style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold)),Icon(Icons.sync,color:Colors.white)])),
);
}
Widget _top(IconData icon,String t)=>Column(children:[Container(width:85,height:70,decoration:BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(10),border:Border.all(color:const Color(0xFFEEEEEE)),boxShadow:[BoxShadow(color:Colors.black12,blurRadius:3)]),child:Icon(icon,size:42,color:const Color(0xFF1E5AA8))),const SizedBox(height:8),Container(padding:const EdgeInsets.symmetric(horizontal:18,vertical:5),decoration:BoxDecoration(color:const Color(0xFF1E5AA8),borderRadius:BorderRadius.circular(20)),child:Text(t,style:const TextStyle(color:Colors.white,fontSize:12,fontWeight:FontWeight.bold)))]);
Widget _bar(String t,bool o,VoidCallback f)=>InkWell(onTap:f,child:Container(color:const Color(0xFF1E5AA8),padding:const EdgeInsets.symmetric(vertical:12,horizontal:14),margin:const EdgeInsets.only(top:1),child:Row(children:[Icon(o?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down,color:Colors.white,size:22),const Spacer(),Text(t,style:const TextStyle(color:Colors.white,fontWeight:FontWeight.bold,fontSize:14))]))); 
Widget _it(String t)=>Container(color:Colors.white,padding:const EdgeInsets.symmetric(vertical:14,horizontal:18),margin:const EdgeInsets.only(bottom:0.8),child:Row(children:[const Spacer(),Text(t,style:const TextStyle(fontSize:14))]));
}
