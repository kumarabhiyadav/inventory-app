import 'package:flutter/material.dart';
import 'package:inventory_app/commonWidgets/app_bar.dart';
import 'package:inventory_app/commonWidgets/name_tile.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppBar(title: "Manage Product"),
      body: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05,
        ),
        separatorBuilder: ((context, index) => const Divider(
              color: Colors.transparent,
            )),
        itemBuilder: ((context, index) => Nametile()),
        itemCount: 3,
      ),
    );
  }
}
