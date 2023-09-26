import 'package:flutter/material.dart';
import 'package:inventory_app/InventoryModule/models/inventory_models.dart';
import 'package:inventory_app/InventoryModule/providers/inventory_provider.dart';
import 'package:inventory_app/commonWidgets/app_bar.dart';
import 'package:inventory_app/commonWidgets/name_tile.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<CategoryModel> categories =
        Provider.of<InventoryProvider>(context).categories;

    return Scaffold(
      appBar: const CustomAppBar(title: "Categories"),
      body: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.width * 0.02),
        separatorBuilder: ((context, index) => const Divider(
              color: Colors.transparent,
            )),
        itemBuilder: ((context, index) => Nametile(
              icon: 'assets/svgs/category.svg',
              idNameType: {
                'id': categories[index].id,
                'name': categories[index].name,
                'type': 'Category'
              },
            )),
        itemCount: categories.length,
      ),
    );
  }
}