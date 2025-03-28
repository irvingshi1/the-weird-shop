import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_weird_shop/receipt_details_screen.dart';
import 'package:the_weird_shop/user_data.dart';

class ReceiptsTab extends StatefulWidget {
  const ReceiptsTab({super.key});

  @override
  State<ReceiptsTab> createState() {
    return _ReceiptsTab();
  }
}

class _ReceiptsTab extends State<ReceiptsTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserData>(
      builder: (BuildContext context, UserData userData, Widget? child) {
        return ListView.builder(
          itemCount: userData.getReceiptList().length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(userData.getReceiptList()[index].getName()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const ReceiptDetailsScreen();
                    },
                    settings: RouteSettings(
                      arguments: userData.getReceiptList()[index],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
