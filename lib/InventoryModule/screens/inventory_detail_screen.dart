import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventory_app/InventoryModule/providers/inventory_provider.dart';
import 'package:inventory_app/InventoryModule/screens/success_screen.dart';
import 'package:inventory_app/api.dart';
import 'package:inventory_app/commonWidgets/app_bar.dart';
import 'package:inventory_app/commonWidgets/primary_button.dart';
import 'package:inventory_app/commonWidgets/secondary_button.dart';
import 'package:inventory_app/commonWidgets/toastmessage.dart';
import 'package:inventory_app/purchaseModule/models/purchase.model.dart';
import 'package:provider/provider.dart';

class InventoryDetailScreen extends StatefulWidget {
  const InventoryDetailScreen(
      {super.key,
      required this.subProduct,
      required this.inStock,
      required this.id,
      required this.logs});
  final PurchaseSubProduct subProduct;
  final num inStock;
  final String id;
  final List<dynamic> logs;

  @override
  State<InventoryDetailScreen> createState() => _InventoryDetailScreenState();
}

class _InventoryDetailScreenState extends State<InventoryDetailScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _costController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  Size size = const Size(0, 0);
  bool showPrice = false;
  bool isLoading = false;

  makeSell() async {
    // print(_formKey.currentState!.validate());
    // if (!_formKey.currentState!.validate()) return;
    setState(() {
      isLoading = true;
    });

    try {
      final result =
          await Provider.of<InventoryProvider>(context, listen: false)
              .sellByQrCode(
                  widget.id,
                  _quantityController.text,
                  _costController.text,
                  _noteController.text == "" ? "NULL" : _noteController.text);

      if (result['success']) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const SuccessScreen(
                      message: "Marked as sell",
                    )));
        return;
      }
      showToast(
          message: "Failed to Log in Inventory",
          color: Theme.of(context).colorScheme.error);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  showBottomInput() => showModalBottomSheet(
      context: context,
      builder: (context) => Container(
            padding: EdgeInsets.all(size.width * 0.05),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: const TextInputType.numberWithOptions(),
                    controller: _quantityController,
                    validator: (val) {
                      if (val == null) {
                        return "Please enter a quantity";
                      }

                      if (int.tryParse(val) != null) {
                        return "Please enter a  valid quantity";
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        fillColor: Colors.black12,
                        focusColor: Colors.grey,
                        filled: true,
                        hintText: "Quantity"),
                  ),
                  SizedBox(
                    height: size.width * 0.05,
                  ),
                  TextFormField(
                    keyboardType: const TextInputType.numberWithOptions(),
                    controller: _costController,
                    validator: (val) {
                      if (val == null) {
                        return "Please enter a cost";
                      }

                      if (int.tryParse(val) != null) {
                        return "Please enter a  valid cost";
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        fillColor: Colors.black12,
                        focusColor: Colors.grey,
                        filled: true,
                        hintText: "Price"),
                  ),
                  SizedBox(
                    height: size.width * 0.05,
                  ),
                  TextFormField(
                    controller: _noteController,
                    decoration: const InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        fillColor: Colors.black12,
                        focusColor: Colors.grey,
                        filled: true,
                        hintText: "Note"),
                  ),
                  SizedBox(
                    height: size.width * 0.1,
                  ),
                  PrimaryButton(
                      function: () {
                        Navigator.pop(context);
                        makeSell();
                      },
                      height: size.width * 0.15,
                      title: "Sell",
                      width: size.width * 0.9),
                ],
              ),
            ),
          ));
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.subProduct.name,
        leading: GestureDetector(
            onTap: () {
              Navigator.popUntil(
                context,
                (route) => route
                    .isFirst, // Stop popping when the first route is reached
              );
            },
            child: const BackButtonIcon()),
      ),
      body: Container(
        margin: EdgeInsets.all(size.width * 0.05),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: size.width * 0.1,
                  width: size.width * 0.1,
                  child: widget.subProduct.image == null
                      ? const Icon(Icons.image_not_supported_rounded)
                      : Image.network(widget.subProduct.image!),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Quantity",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showPrice = !showPrice;
                    });
                  },
                  child: Text(
                    "Rate",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${widget.subProduct.quantity}"),
                showPrice
                    ? showRate
                        ? Text("${widget.subProduct.cost}")
                        : const Text('-----')
                    : const Text('***')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "P",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                Text(
                  "MAX Price",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${widget.subProduct.sellingprice}"),
                Text("${widget.subProduct.mrp}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "In Stock",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                Text(
                  "Name",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${widget.inStock}"),
                Text("${widget.subProduct.name}"),
              ],
            ),
            SizedBox(
              height: size.width * 0.1,
            ),
            Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "History",
                )),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...widget.logs.map(
                      (e) => Container(
                        margin: EdgeInsets.all(size.width * 0.02),
                        padding: EdgeInsets.all(size.width * 0.02),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black12),
                          color: Colors.white,
                          boxShadow: [],
                        ),
                        width: double.infinity,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Quantity",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                ),
                                Text(
                                  "Cost",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${e['qyt']}"),
                                Text("${e['cost']}"),
                              ],
                            ),
                            SizedBox(
                              height: size.width * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.calendar_month_outlined,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                Text(
                                  DateFormat('dd MMM yyyy hh:mm a').format(
                                      DateTime.parse(e['createdAt']).toLocal()),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.2,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: PrimaryButton(
          function: () async {
            showBottomInput();
          },
          height: size.width * 0.15,
          title: "Sell",
          width: size.width * 0.9),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
