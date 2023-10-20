import 'package:flutter/material.dart';
import 'package:inventory_app/InventoryModule/models/inventory_models.dart';
import 'package:inventory_app/InventoryModule/providers/inventory_provider.dart';
import 'package:inventory_app/commonWidgets/app_bar.dart';
import 'package:inventory_app/commonWidgets/name_tile.dart';
import 'package:provider/provider.dart';



class ProductScreen extends StatefulWidget {
  const ProductScreen(
      {Key? key, required this.categoryId, required this.categoryName})
      : super(key: key);
  final String categoryId;
  final String categoryName;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<ProductModel> products =
        Provider.of<InventoryProvider>(context).products;

    return Scaffold(
      appBar: CustomAppBar(title: widget.categoryName),
      body: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.width * 0.02),
        separatorBuilder: ((context, index) => const Divider(
              color: Colors.transparent,
            )),
        itemBuilder: ((context, index) => Nametile(
            icon:  products[index].imagePath,
              name: products[index].name,
            )),
        itemCount: products.length,
      ),
    );
  }
}

class SubProductScreen extends StatefulWidget {
  const SubProductScreen(
      {Key? key, required this.productId, required this.productName})
      : super(key: key);
  final String productId;
  final String productName;

  @override
  State<SubProductScreen> createState() => _SubProductScreenState();
}

class _SubProductScreenState extends State<SubProductScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<SubProductModel> subProducts =
        Provider.of<InventoryProvider>(context).subProducts;

    return Scaffold(
      appBar: CustomAppBar(title: widget.productName),
      body: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.width * 0.02),
        separatorBuilder: ((context, index) => const Divider(
              color: Colors.transparent,
            )),
        itemBuilder: ((context, index) => Nametile(
              icon:  subProducts[index].imagePath,
              name: subProducts[index].name,
              
             
            )),
        itemCount: subProducts.length,
      ),
    );
  }
}
