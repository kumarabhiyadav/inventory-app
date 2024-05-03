// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:inventory_app/InventoryModule/models/inventory_models.dart';
import 'package:inventory_app/InventoryModule/providers/inventory_provider.dart';
import 'package:inventory_app/InventoryModule/screens/sub_product_purchase_screen.dart';
import 'package:inventory_app/commonWidgets/app_bar.dart';
import 'package:inventory_app/commonWidgets/name_tile.dart';
import 'package:inventory_app/commonWidgets/primary_button.dart';
import 'package:inventory_app/commonWidgets/snack_bar.dart';
import 'package:inventory_app/purchaseModule/providers/purchase_provider.dart';
import 'package:inventory_app/purchaseModule/widget/adding_product_for_purchase.dart';
import 'package:provider/provider.dart';

class SubProductScreen extends StatefulWidget {
  SubProductScreen(
      {Key? key, required this.productModel, required this.categoryModel})
      : super(key: key);

  ProductModel productModel;
  CategoryModel categoryModel;

  @override
  State<SubProductScreen> createState() => _SubProductScreenState();
}

class _SubProductScreenState extends State<SubProductScreen> {
  final TextEditingController _subProductController = TextEditingController();
  bool isLoading =  false;
  @override
  void initState() {
    myInit();
    super.initState();
  }

  myInit() async {
    await Provider.of<InventoryProvider>(context, listen: false)
        .fetchSubProducts(widget.productModel.id);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<SubProductModel> subProducts =
        Provider.of<InventoryProvider>(context).subProducts;

    return Scaffold(
      appBar: CustomAppBar(title: widget.productModel.name),
      body:  isLoading ? const Center(child: CircularProgressIndicator(),): ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.width * 0.02),
        separatorBuilder: ((context, index) => const Divider(
              color: Colors.transparent,
            )),
        itemBuilder: ((context, index) => GestureDetector(
              onTap:
                  Provider.of<PurchaseProvider>(context).currentPurchaseModel !=
                          null
                      ? () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) => AddProductForPurchase(
                                    subProductModel: subProducts[index],
                                  ));
                        }
                      : () {

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SubProductPurchase(subProductModel: subProducts[index],)));
                      },
              child: Nametile(
                icon: subProducts[index].imagePath,
                name: subProducts[index].name,
              ),
            )),
        itemCount: subProducts.length,
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
                                controller: _subProductController,
                                validator: ((value) {
                                  if (value!.trim().isEmpty) {
                                    return "Please enter sub product";
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
                                    hintText: "Enter Sub Product"),
                              ),
                              SizedBox(
                                height: size.width * 0.05,
                              ),
                              PrimaryButton(
                                  function: isLoading ? (){} : () async {
                                    if (_subProductController.text.trim() ==
                                        "") {
                                      return;
                                    }

                                    setState(() {
                                      isLoading = true;
                                    });
                                    final response = await Provider.of<
                                                InventoryProvider>(context,
                                            listen: false)
                                        .createSubProduct(
                                            name: _subProductController.text,
                                            categoryModel: widget.categoryModel,
                                            productModel: widget.productModel);
                                  setState(() {
                                    isLoading = false;
                                  });
                                    
                                    Navigator.of(context).pop();
                                  
                                    if (response != null) {
                                      showSnackBar(
                                          context: context,
                                          title: "Sub Product Added Successfully");
                                      setState(() {
                                        _subProductController.text = "";
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
                'Add New Sub Product',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
              )),
    );
  }
}
