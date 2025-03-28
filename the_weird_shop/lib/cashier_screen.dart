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
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cashier')),
      body: Consumer<UserData>(
        builder: (BuildContext context, UserData userData, Widget? child) {
          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  const Text('Enter receipt name:'),
                  TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      userData.addToReceiptList(_controller.text);
                    },
                    child: const Text('Confirm Purchase'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      userData.returnItems();
                    },
                    child: const Text('Return Items'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
