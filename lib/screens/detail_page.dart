import 'package:flutter/material.dart';
import 'package:flutter_inventory/models/item.dart';

class ItemDetailPage extends StatelessWidget {
  final Item item;

  const ItemDetailPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Card(
          elevation: 8.0, // Add a shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0), // Add rounded corners
          ),
          margin: const EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.fields.name,
                  style: const TextStyle(
                    fontSize: 24.0, // Increase font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Price: ${item.fields.price}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 12),
                Text(
                  "Amount: ${item.fields.amount}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 12),
                Text(
                  "Description: ${item.fields.description}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 12),
                Text(
                  "Product Release Date: ${item.fields.productReleaseDate}",
                  style: const TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context); // Return to the item list page
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
