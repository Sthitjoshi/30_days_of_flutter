import 'dart:convert';
import 'package:basics_of_flutter_30days/models/catalog.dart';
import 'package:basics_of_flutter_30days/utils/routes.dart';
import 'package:basics_of_flutter_30days/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "STHITA";

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
        backgroundColor:context.canvasColor,
        floatingActionButton: FloatingActionButton(
          onPressed:()=> Navigator.pushNamed(context, myRoutes.cartRoutes),
          backgroundColor: MyTheme.creamColor,
        child: const Icon(CupertinoIcons.cart),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                 CatalogList().py12().expand()
                else
                  Center(
                    child: const CircularProgressIndicator().centered().expand().py16(),
                  )
              ],
            ),
          ),
        ));
  }
}