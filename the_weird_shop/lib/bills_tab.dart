import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_weird_shop/user_data.dart';

class BillsTab extends StatefulWidget {
  const BillsTab({super.key});

  @override
  State<BillsTab> createState() {
    return _BillsTab();
  }
}

class _BillsTab extends State<BillsTab> {
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
    return SingleChildScrollView(
      child: Consumer<UserData>(
        builder: (BuildContext context, UserData userData, Widget? child) {
          return Column(
            children: <Widget>[
              Text('You have ${userData.getMoney()} money.'),
              const Text('Set amount of money:'),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
