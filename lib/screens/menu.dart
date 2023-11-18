import 'package:flutter/material.dart';
import 'package:flutter_inventory/widgets/item_card.dart';
import 'package:flutter_inventory/widgets/left_drawer.dart';

class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

    final List<ShopItem> items = [
      ShopItem("View Items", Icons.checklist, Colors.red),
      ShopItem("Add Item", Icons.add_shopping_cart, Colors.orange),
      ShopItem("Logout", Icons.logout, Colors.yellow)
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Flutter Inventory',
            ),
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
          ),
          drawer: const LeftDrawer(),
          body: SingleChildScrollView(
            // Scrolling wrapper widget
            child: Padding(
              padding: const EdgeInsets.all(10.0), // Set padding for the page
              child: Column(
                // Widget to display children vertically
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    // Text widget to display text with center alignment and appropriate style
                    child: Text(
                      'Los Pollos Hermanos', // Text indicating the shop name
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Grid layout
                  GridView.count(
                    // Container for our cards.
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((ShopItem item) {
                      // Iteration for each item
                      return ShopCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}