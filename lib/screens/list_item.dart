import 'package:flutter/material.dart';
import 'package:flutter_inventory/widgets/left_drawer.dart';
import 'package:flutter_inventory/models/item.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:flutter_inventory/screens/detail_page.dart';

class ViewItemPage extends StatefulWidget {
  const ViewItemPage({Key? key}) : super(key: key);

  @override
  _ViewItemPageState createState() => _ViewItemPageState();
}

class _ViewItemPageState extends State<ViewItemPage> {
  Future<List<Item>> fetchItem() async {
      final request = context.watch<CookieRequest>();
      final response = await request.get('http://127.0.0.1:8000/json/');

      // convert the JSON to Item object
      List<Item> list_item = [];
      for (var d in response) {
          if (d != null) {
              list_item.add(Item.fromJson(d));
          }
      }
      return list_item;
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
          title: const Text('View Items'),
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          ),
          drawer: const LeftDrawer(),
          body: FutureBuilder(
              future: fetchItem(),
              builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                      return const Center(child: CircularProgressIndicator());
                  } else {
                      if (!snapshot.hasData) {
                      return const Column(
                          children: [
                          Text(
                              "No Item data available.",
                              style:
                                  TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                          ),
                          SizedBox(height: 8),
                          ],
                      );
                  } else {
                       return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Card(
                           margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          // Wrap the ListTile in a GestureDetector to make it tappable
                          child: GestureDetector(
                            onTap: () {
                              // Navigate to the detail page when an item is tapped
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ItemDetailPage(item: snapshot.data![index]),
                                ),
                              );
                            },
                            child: ListTile(
                              title: Text(
                                "${snapshot.data![index].fields.name}",
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text("Price: ${snapshot.data![index].fields.price} \nAmount: ${snapshot.data![index].fields.amount} \nDescription: ${snapshot.data![index].fields.description}"),
                            ),
                          ),
                        ),
                      );
                    }
                  }
              }));
      }
}