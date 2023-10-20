import 'package:flutter/material.dart';
import 'package:inventory_app/InventoryModule/models/inventory_models.dart';
import 'package:inventory_app/InventoryModule/providers/inventory_provider.dart';
import 'package:inventory_app/InventoryModule/screens/product_screens.dart';
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
        itemBuilder: ((context, index) => GestureDetector(
              onTap: () =>
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductScreen(
                      categoryId: categories[index].id,
                      categoryName: categories[index].name),
                ),
              ),
              child: Nametile(
                icon: categories[index].imagePath,
                name: categories[index].name,
              ),
            )),
        itemCount: categories.length,
      ),

       floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    context: context,
                    isScrollControlled: true,
                    builder: (context) =>  Container(
                      height: size.height*0.5,
                      child: Column(
                        children: [
                          
                        ],
                      ),
                    ))
                .then((value) {
              if (value != null) {
                print(value);
              }
            });
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => const AddPurchaseScreen()));
          },
          icon: const Icon(Icons.add),
          label: Text(
            'Add New Category',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
          )),
    );
  }
}
