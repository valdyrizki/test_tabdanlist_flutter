import 'package:flutter/material.dart';
import 'package:test_tab_flutter/components/inputbelanja.dart';
import 'package:test_tab_flutter/components/listbelanja.dart';
import 'package:test_tab_flutter/models/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyTab createState() => MyTab();
}


class MyTab extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController controller;

  final List<Cart> _carts = [
    Cart(id: 'DW1', title: 'Sabun Mandi', harga: 15000, qty: 1),
  ];
  

  @override
   void initState(){
    super.initState();
    controller = TabController(vsync: this, length: 2);
  }

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('BelanjaCuy.com'),
          backgroundColor: Colors.blueAccent,
          bottom: TabBar(
            controller: controller,
            tabs: <Tab>[
              Tab(icon: Icon(Icons.home),),
              Tab(icon: Icon(Icons.note),),
            ]
          ),
        ),
        //CODE BARU
        body: TabBarView(
          controller: controller,
          children: <Widget>[
            InputBelanja(_carts),
            ListBelanja(_carts),
          ]
        ),
      )
    );
  }
}





