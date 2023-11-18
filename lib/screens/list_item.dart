import 'package:flutter/material.dart';
import 'package:flutter_inventory/widgets/left_drawer.dart';
import 'package:flutter_inventory/models/item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ViewItemPage extends StatefulWidget {
  const ViewItemPage({Key? key}) : super(key: key);

  @override
  State<ViewItemPage> createState() => _ViewItemPageState();
}

class _ViewItemPageState extends State<ViewItemPage> {
  Future<List<Item>> fetchItem() async {
      var url = Uri.parse(
          'http://127.0.0.1:8000/json/');
      var response = await http.get(
          url,
          headers: {"Content-Type": "application/json"},
      );

      // decode the response to JSON
      var data = jsonDecode(utf8.decode(response.bodyBytes));

      // convert the JSON to Item object
      List<Item> list_item = [];
      for (var d in data) {
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
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${snapshot.data![index].fields.name}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text("${snapshot.data![index].fields.price}"),
                                const SizedBox(height: 10),
                                Text("${snapshot.data![index].fields.amount}"),
                                const SizedBox(height: 10),
                                Text("${snapshot.data![index].fields.description}"),
                                const SizedBox(height: 10),
                                Text("${snapshot.data![index].fields.productReleaseDate}")
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  }
              }));
      }
}