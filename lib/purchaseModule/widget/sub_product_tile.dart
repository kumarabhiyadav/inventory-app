import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inventory_app/InventoryModule/models/inventory_models.dart';

import '../../colors.dart';

class SubProductTile extends StatelessWidget {
  const SubProductTile({Key? key, required this.subProductModel})
      : super(key: key);
  final SubProductModel subProductModel;

  @override
  Widget build(BuildContext context) {
    final dW = MediaQuery.of(context).size.width;

    return ListTile(
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Colors.black26),
        borderRadius: BorderRadius.circular(5),
      ),
      title: Text(
        subProductModel.name,
        style: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(fontSize: 15, color: Colors.black),
      ),
      leading: Container(
        padding: EdgeInsets.all(dW * 0.01),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black26, width: .8)),
        child: SvgPicture.asset(
          'assets/svgs/subproduct.svg',
          height: 25,
          width: 25,
          fit: BoxFit.fill,
          color: iconColor,
        ),
      ),
    );
  }
}
