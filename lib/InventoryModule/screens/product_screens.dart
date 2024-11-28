// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:inventory_app/InventoryModule/models/inventory_models.dart';
import 'package:inventory_app/InventoryModule/providers/inventory_provider.dart';
import 'package:inventory_app/InventoryModule/screens/sub_product_screens.dart';
import 'package:inventory_app/commonWidgets/app_bar.dart';
import 'package:inventory_app/commonWidgets/name_tile.dart';
import 'package:inventory_app/commonWidgets/primary_button.dart';
import 'package:inventory_app/commonWidgets/snack_bar.dart';
import 'package:inventory_app/purchaseModule/providers/purchase_provider.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key, required this.categoryModel})
      : super(key: key);

  final CategoryModel categoryModel;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final TextEditingController _productController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    myInit();
    super.initState();
  }

  myInit() async {
    await Provider.of<InventoryProvider>(context, listen: false)
        .fetchProducts(widget.categoryModel.id);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<ProductModel> products =
        Provider.of<InventoryProvider>(context).products;

    return Scaffold(
      appBar: CustomAppBar(title: widget.categoryModel.name),
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
                            builder: (context) => SubProductScreen(
                                productModel: products[index],
                                categoryModel: widget.categoryModel))),
                    child: Nametile(
                      deletefun:(){} ,
                      icon: products[index].imagePath,
                      name: products[index].name,
                    ),
                  )),
              itemCount: products.length,
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
                                controller: _productController,
                                validator: ((value) {
                                  if (value!.trim().isEmpty) {
                                    return "Please enter product";
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
                                    hintText: "Enter Product"),
                              ),
                              SizedBox(
                                height: size.width * 0.05,
                              ),
                              PrimaryButton(
                                  function: isLoading
                                      ? () {}
                                      : () async {
                                          if (_productController.text.trim() ==
                                              "") {
                                            return;
                                          }

                                          if (isLoading) return;
                                          setState(() {
                                            isLoading = true;
                                          });


                                          final response = await Provider.of<
                                                      InventoryProvider>(
                                                  context,
                                                  listen: false)
                                              .createProduct(
                                                  name: _productController.text,
                                                  categoryModel:
                                                      widget.categoryModel);
                                          Navigator.of(context).pop();

                                          setState(() {
                                            isLoading = false;
                                          });
                                          if (response != null) {
                                            showSnackBar(
                                                context: context,
                                                title:
                                                    "Product Added Successfully");
                                            setState(() {
                                              _productController.text = "";
                                            });
                                          }
                                        },
                                  height: size.width * 0.12,
                                  title: "Save",
                                  width: size.width * 0.9)
                            ],
                          ),
                        ));
              },
              icon: const Icon(Icons.add),
              label: Text(
                'Add New Product',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
              )),
    );
  }
}
