import 'package:flutter/material.dart';

class CreditsTab extends StatelessWidget {
  const CreditsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Text(
            'Credits',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const Text('App created by Irving Shi'),
          const Text(
            'Inspired by Reigarw Comparisons\' '
            'Price Comparison (Most Expensive Substance)',
          ),
        ],
      ),
    );
  }
}
