import 'package:flutter/material.dart';
import 'package:flutter_inventory/widgets/left_drawer.dart';
import 'package:flutter_inventory/models/item.dart';

class ViewItemPage extends StatefulWidget {
  const ViewItemPage({super.key});

  @override
  State<ViewItemPage> createState() => _ViewItemPageState();
}

class _ViewItemPageState extends State<ViewItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('View Items'),
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
        ),
        drawer: const LeftDrawer(),
        body: SingleChildScrollView(
            child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: Item.listItem.map((Item P) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            P.Name,
                            style: const TextStyle(fontSize: 24.0),
                          ),
                          Text(
                            "Price: ${P.Price}",
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            "Amount: ${P.Amount}",
                            style: const TextStyle(fontSize: 16.0),
                          )
                        ],
                      ),
                      const SizedBox(height: 12.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            P.Description,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        )));
  }
}