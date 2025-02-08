import 'package:flutter/material.dart';
import 'package:the_weird_shop/bills_tab.dart';
import 'package:the_weird_shop/credits_tab.dart';
import 'package:the_weird_shop/receipts_tab.dart';
import 'package:the_weird_shop/shop_tab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Weird Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'The Weird Shop'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'The Weird Shop',
          ),
          bottom: const TabBar(
            tabs: <Tab>[
              Tab(
                text: 'Bills',
                icon: Icon(
                  Icons.attach_money,
                ),
              ),
              Tab(
                text: 'Shop',
                icon: Icon(
                  Icons.shopping_cart,
                ),
              ),
              Tab(
                text: 'Receipts',
                icon: Icon(
                  Icons.list,
                ),
              ),
              Tab(
                text: 'Credits',
                icon: Icon(
                  Icons.list,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: <Widget>[
              const BillsTab(),
              const ShopTab(),
              const ReceiptsTab(),
              const CreditsTab(),
            ],
          ),
        ),
      ),
    );
  }
}
