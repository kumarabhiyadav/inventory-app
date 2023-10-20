import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:inventory_app/colors.dart';

// ignore: must_be_immutable
class Nametile extends StatelessWidget {
  Nametile({Key? key, required this.name, required this.icon})
    : super(key: key);
   String name;
  String icon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListTile(
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Colors.black26),
        borderRadius: BorderRadius.circular(5),
      ),
      title: Text(
        name,
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
