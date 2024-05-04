// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:inventory_app/InventoryModule/models/inventory_models.dart';
import 'package:inventory_app/InventoryModule/providers/inventory_provider.dart';
import 'package:inventory_app/InventoryModule/screens/product_screens.dart';
import 'package:inventory_app/commonWidgets/app_bar.dart';
import 'package:inventory_app/commonWidgets/name_tile.dart';
import 'package:inventory_app/commonWidgets/primary_button.dart';
import 'package:inventory_app/commonWidgets/snack_bar.dart';
import 'package:inventory_app/purchaseModule/providers/purchase_provider.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final TextEditingController _categoryController = TextEditingController();

  bool isLoading = false;

  @override
  void initState() {
    myInit();
    super.initState();
  }

  myInit() async {
    await Provider.of<InventoryProvider>(context, listen: false)
        .fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<CategoryModel> categories =
        Provider.of<InventoryProvider>(context).categories;

    return Scaffold(
      appBar: const CustomAppBar(title: "Categories"),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: size.width * 0.02),
              separatorBuilder: ((context, index) => const Divider(
                    color: Colors.transparent,
                  )),
              itemBuilder: ((context, index) => GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProductScreen(categoryModel: categories[index])),
                    ),
                    child: Nametile(
                      icon: categories[index].imagePath,
                      name: categories[index].name,
                    ),
                  )),
              itemCount: categories.length,
            ),
      floatingActionButton: Provider.of<PurchaseProvider>(context)
                  .currentPurchaseModel !=
              null
          ? null
          : FloatingActionButton.extended(
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
                    builder: (context) => Container(
                          padding: EdgeInsets.all(size.width * 0.05),
                          height: size.height * 0.5,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _categoryController,
                                validator: ((value) {
                                  if (value!.trim().isEmpty) {
                                    return "Please Choose a date";
                                  }
                                  return null;
                                }),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                                decoration: const InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    fillColor: Colors.black12,
                                    focusColor: Colors.grey,
                                    filled: true,
                                    hintText: "Enter category"),
                              ),
                              SizedBox(
                                height: size.width * 0.05,
                              ),
                              PrimaryButton(
                                  function: isLoading
                                      ? () {}
                                      : () async {
                                          if (_categoryController.text.trim() ==
                                              "") {
                                            return;
                                          }

                                          if(isLoading) return;

                                          setState(() {
                                            isLoading = true;
                                          });

                                          print(_categoryController.text);
                                          final response = await Provider.of<
                                                      InventoryProvider>(
                                                  context,
                                                  listen: false)
                                              .createCategory(
                                                  name:
                                                      _categoryController.text);

                                          Navigator.of(context).pop();

                                          setState(() {
                                            isLoading = false;
                                          });
                                          if (response != null) {
                                            showSnackBar(
                                                context: context,
                                                title:
                                                    "Category Added Successfully");
                                            setState(() {
                                              _categoryController.text = "";
                                              isLoading = false;
                                            });
                                          }
                                        },
                                  height: size.width * 0.12,
                                  title: "Save",
                                  width: size.width * 0.9)
                            ],
                          ),
                        ));
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
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
              )),
    );
  }
}
