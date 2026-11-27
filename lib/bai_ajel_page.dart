import 'package:flutter/material.dart';

class BaiAjelPage extends StatefulWidget {
  @override
  State<BaiAjelPage> createState() => _BaiAjelPageState();
}

class _BaiAjelPageState extends State<BaiAjelPage> {
  bool isAjel = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isAjel ? 'بيع آجل' : 'بيع نقدي'),
        backgroundColor: isAjel ? Colors.orange : Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('نقدي'),
            Switch(
              value: isAjel,
              onChanged: (v) {
                setState(() {
                  isAjel = v;
                });
              },
            ),
            Text('آجل'),
          ],
        ),
      ),
    );
  }
}
