import 'dart:convert';
import 'package:basics_of_flutter_30days/models/catalog.dart';
import 'package:basics_of_flutter_30days/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:basics_of_flutter_30days/widgets/items.dart';
import 'package:flutter/services.dart';

//
// class HomePage extends StatefulWidget {
//
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "sthita";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
    await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final item = CatalogModel.items[index];
            return Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: GridTile(
                  header: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Colors.deepPurple,
                    ),
                    child: Text(
                      item.name,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  footer: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Text(
                      item.price.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  child: Image.network(
                    item.image,
                  ),
                ));
          },
          itemCount: CatalogModel.items.length,
        )
            : const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}