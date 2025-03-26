import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_weird_shop/user_data.dart';

class CashierScreen extends StatefulWidget {
  const CashierScreen({super.key});

  @override
  State<CashierScreen> createState() {
    return _CashierScreen();
  }
}

class _CashierScreen extends State<CashierScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cashier')),
      body: Consumer<UserData>(
        builder: (BuildContext context, UserData userData, Widget? child) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    userData.resetItemList();
                  },
                  child: const Text('Confirm Purchase'),
                ),
                ElevatedButton(
                  onPressed: () {
                    userData.addToReceiptList();
                  },
                  child: const Text('Return Items'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
