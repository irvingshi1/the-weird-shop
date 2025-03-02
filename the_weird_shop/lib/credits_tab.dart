import 'package:flutter/material.dart';

class CreditsTab extends StatefulWidget {
  const CreditsTab({super.key});

  @override
  State<CreditsTab> createState() {
    return _CreditsTab();
  }
}

class _CreditsTab extends State<CreditsTab> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Text('Credits'),
        ],
      ),
    );
  }
}
