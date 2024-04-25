import 'package:flutter/material.dart';
import 'package:inventory_app/InventoryModule/models/inventory_models.dart';
import 'package:inventory_app/InventoryModule/providers/inventory_provider.dart';
import 'package:inventory_app/commonWidgets/app_bar.dart';
import 'package:inventory_app/purchaseModule/models/supplier.model.dart';
import 'package:inventory_app/purchaseModule/widget/adding_product_for_purchase.dart';
import 'package:inventory_app/purchaseModule/widget/sub_product_tile.dart';
import 'package:provider/provider.dart';

class AddPurchaseScreen extends StatefulWidget {
  const AddPurchaseScreen({
    Key? key,
    required this.supplierModel
  }) : super(key: key);


  final SupplierModel supplierModel;

  @override
  State<AddPurchaseScreen> createState() => _AddPurchaseScreenState();
}

class _AddPurchaseScreenState extends State<AddPurchaseScreen> {


  addNewProduct(SubProductModel subProductModel) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => AddProductForPurchase(subProductModel: subProductModel,));
  }

  @override
  void initState() {
    myInit();
    super.initState();
  }

  myInit()async{
    await Provider.of<InventoryProvider>(context,listen: false).searchSubProducts("");
  }

  @override
  Widget build(BuildContext context) {
    final dW = MediaQuery.of(context).size.width;
    final dH = MediaQuery.of(context).size.width;
    final subProduct = Provider.of<InventoryProvider>(context).searchedSubProduct;

    return Scaffold(
      appBar: CustomAppBar(title: "Add Product"),
      body: Container(
        margin:
            EdgeInsets.symmetric(horizontal: dW * 0.05, vertical: dW * 0.05),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: TextFormField(
                decoration: const InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    fillColor: Colors.black12,
                    focusColor: Colors.grey,
                    filled: true,
                    hintText: "Select Sub Product"),
              ),
            ),
            SizedBox(
              height: dW * 0.05,
            ),
           
            Expanded(
                child: ListView.separated(
              separatorBuilder: ((context, index) => const Divider(
                    color: Colors.transparent,
                  )),
              itemBuilder: (context, index) => Card(
                  elevation: 0,
                  color: Colors.transparent,
                  child: InkWell(
                      onTap: () {
                        addNewProduct(subProduct[index]);
                      },
                      child:
                          SubProductTile(subProductModel: subProduct[index]))),
              itemCount: subProduct.length,
            ))
          ],
        ),
      ),
    );
  }
}
