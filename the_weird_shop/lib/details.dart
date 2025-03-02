import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_weird_shop/item.dart';
import 'package:the_weird_shop/user_data.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _Details();
}

class _Details extends State<Details> {
  late TextEditingController _controller;

  final AlertDialog purchaseError = const AlertDialog(
    title: Text('Invalid Input'),
    content: Text('The amount purchase needs to be a number.'),
  );

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
    final Item entry = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              entry.getName(),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text('Cost: ${entry.getCost()} per item.'),
            const Text('Enter amount to purchase (input negative number to sell):'),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            Consumer<UserData>(
              builder:
                  (BuildContext context, UserData userData, Widget? child) {
                return ElevatedButton(
                  onPressed: () {
                    try {
                      final double amount = double.parse(_controller.text);

                      final double cost = amount * entry.getCost();

                      final double money = userData.getMoney();

                      if(amount < 0) {
                        userData.setMoney(money - cost);

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Selling Succeeded'),
                              content: Text('Sold ${-amount} ${entry.getName()}.'),
                            );
                          },
                        );
                      }
                      else if (cost <= money) {
                        userData.setMoney(money - amount * entry.getCost());

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Purchase Succeeded'),
                              content: Text('Brought $amount ${entry.getName()}.'),
                            );
                          },
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const AlertDialog(
                              title: Text('Purchase Failed'),
                              content: Text('Not enough money.'),
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
                                'The amount purchased needs to be a number.'),
                          );
                        },
                      );
                    }
                  },
                  child: const Text('Submit'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
