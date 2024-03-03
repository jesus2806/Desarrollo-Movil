import 'dart:convert';
import 'package:flutter/material.dart';
import 'Item.dart';

class JsonListViewScreen extends StatefulWidget {
  @override
  _JsonListViewScreenState createState() => _JsonListViewScreenState();
}

class _JsonListViewScreenState extends State<JsonListViewScreen> {
  late List<Item> items;

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  Future<void> loadItems() async {
    String jsonString =
        await DefaultAssetBundle.of(context).loadString('assets/data.json');
    List<dynamic> jsonList = json.decode(jsonString);

    setState(() {
      items = jsonList.map((item) => Item.fromJson(item)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Archivos JSON',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Color.fromARGB(255, 29, 188, 194),
            elevation: 3,
            margin: EdgeInsets.symmetric(horizontal: 450, vertical: 10),
            child: ListTile(
              title: Text(
                items[index].name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: SizedBox(
                width: 30,
                child: Text(
                  'ID: ${items[index].id}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
