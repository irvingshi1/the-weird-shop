import 'package:flutter/material.dart';
import 'package:the_weird_shop/cashier_screen.dart';
import 'package:the_weird_shop/shelves_screen.dart';

class ShopTab extends StatefulWidget {
  const ShopTab({super.key});

  @override
  State<ShopTab> createState() {
    return _ShopTab();
  }
}

class _ShopTab extends State<ShopTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const ShelvesScreen();
                  },
                ),
              );
            },
            child: const Text('To Shelves'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const CashierScreen();
                  },
                ),
              );
            },
            child: const Text('To Cashier'),
          ),
        ],
      ),
    );
  }
}
