import 'package:basics_of_flutter_30days/models/catalog.dart';
import 'package:basics_of_flutter_30days/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:basics_of_flutter_30days/widgets/items.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "sthita";

  const HomePage({super.key});

  get catalogItem => null;
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              key: ValueKey('item_$index'), // Provide a unique key value
              catalogItem: catalogItem, item: CatalogModel.items[0],
            );
          },
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}