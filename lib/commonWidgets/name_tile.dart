import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inventory_app/InventoryModule/screens/product_screens.dart';
import 'package:inventory_app/colors.dart';

class Nametile extends StatelessWidget {
  Nametile({Key? key, required this.idNameType, required this.icon})
      : super(key: key);
  Map<String, String> idNameType = {};
  String icon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final tS = MediaQuery.of(context).textScaleFactor;
    return ListTile(
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Colors.black26),
        borderRadius: BorderRadius.circular(5),
      ),
      onTap: () {
        switch (idNameType['type']) {
          case 'Category':
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductScreen(
                  categoryId: idNameType['id']!,
                  categoryName: idNameType['name']!,
                ),
              ),
            );
            break;

          case 'Product':
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SubProductScreen(
                  productName: idNameType['name']!,
                  productId: idNameType['id']!,
                ),
              ),
            );
            break;
          default:
        }
      },
      title: Text(
        idNameType['name']!,
        style: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(fontSize: 15, color: Colors.black),
      ),
      leading: Container(
        padding: EdgeInsets.all(size.width * 0.01),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black26, width: .8)),
        child: SvgPicture.asset(
          icon,
          height: 25,
          width: 25,
          fit: BoxFit.fill,
          color: iconColor,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/svgs/delete.svg',
            height: 28,
            width: 28,
            fit: BoxFit.fill,
            color: Colors.red,
          ),
          SizedBox(
            width: size.width * 0.025,
          ),
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              'assets/svgs/edit.svg',
              height: 28,
              width: 28,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
