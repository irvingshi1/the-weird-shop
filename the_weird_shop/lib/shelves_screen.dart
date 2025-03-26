import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_weird_shop/item_details_screen.dart';
import 'package:the_weird_shop/user_data.dart';

class ShelvesScreen extends StatefulWidget {
  const ShelvesScreen({super.key});

  @override
  State<ShelvesScreen> createState() {
    return _ShelvesScreen();
  }
}

class _ShelvesScreen extends State<ShelvesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shelves')),
      body: Consumer<UserData>(
        builder: (BuildContext context, UserData userData, Widget? child) {
          return ListView.builder(
            itemCount: userData.getItemList().length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  userData.getItemList()[index].getName(),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const ItemDetailsScreen();
                      },
                      settings: RouteSettings(
                        arguments: userData.getItemList()[index],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
