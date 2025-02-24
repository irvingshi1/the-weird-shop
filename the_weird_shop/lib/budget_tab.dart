import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_weird_shop/user_data.dart';

class BudgetTab extends StatefulWidget {
  const BudgetTab({super.key});

  @override
  State<BudgetTab> createState() {
    return _BudgetTab();
  }
}

class _BudgetTab extends State<BudgetTab> {
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
              const Text('Set budget:'),
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  try {
                    final double money = double.parse(_controller.text);

                    if (money >= 0) {
                      userData.setMoney(money);
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const AlertDialog(
                            title: Text('Invalid Input'),
                            content: Text(
                                'The budget must be a number that\'s at least 0.'),
                          );
                        },
                      );
                    }
                  } catch (e) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AlertDialog(
                          title: Text('Invalid Input'),
                          content: Text(
                              'The budget must be a number that\'s at least 0.'),
                        );
                      },
                    );
                  }
                },
                child: const Icon(Icons.attach_money),
              ),
            ],
          );
        },
      ),
    );
  }
}
