import 'package:flutter/material.dart';
import 'package:inventory_app/colors.dart';
import 'package:inventory_app/purchaseModule/models/supplier.model.dart';


class SupplierTile extends StatelessWidget {
  const SupplierTile({Key? key, required this.dW, required this.supplier})
      : super(key: key);

  final double dW;
  final SupplierModel supplier;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: dW * 0.05),
      child: Container(
        padding: EdgeInsets.all(dW * 0.02),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black26, width: .8)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: iconColor,
              child: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: dW * 0.02,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  supplier.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.56,
                      fontSize: 15),
                ),
                SizedBox(
                  height: dW * 0.01,
                ),
                Text(
                  supplier.address,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.25,
                      color: Colors.black45,
                      fontSize: 12),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
