import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_weird_shop/item.dart';
import 'package:the_weird_shop/user_data.dart';

class ItemDetailsScreen extends StatefulWidget {
  const ItemDetailsScreen({super.key});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreen();
}

class _ItemDetailsScreen extends State<ItemDetailsScreen> {
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
            const Text(
                'Enter amount to purchase (input negative number to sell):'),
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

                      userData.buy(entry, amount, context);
                    } catch (e) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const AlertDialog(
                            title: Text('Invalid Input'),
                            content: Text(
                              'The amount purchased needs to be a number.',
                            ),
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
