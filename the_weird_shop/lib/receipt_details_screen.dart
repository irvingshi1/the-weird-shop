import 'package:flutter/material.dart';
import 'package:the_weird_shop/receipt.dart';
import 'package:the_weird_shop/item.dart';

class ReceiptDetailsScreen extends StatefulWidget {
  const ReceiptDetailsScreen({super.key});

  @override
  State<ReceiptDetailsScreen> createState() => _ReceiptDetailsScreen();
}

class _ReceiptDetailsScreen extends State<ReceiptDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final Receipt entry = ModalRoute.of(context)!.settings.arguments as Receipt;
    
    List<Widget> content = <Widget>[
      Text(
        entry.getName(),
        style: Theme.of(context).textTheme.headlineLarge,
      ),
      Text('Total cost: ${entry.getTotalCost()}'),
    ];
    
    for(Item item in entry.getItemList()) {
      content.insert(content.length - 1, Text('${item.getName()} - ${item.getAmount()}'));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Receipt Details'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: content,
          ),
        ),
      ),
    );
  }
}
