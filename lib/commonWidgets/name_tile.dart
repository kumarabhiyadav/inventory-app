import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inventory_app/colors.dart';

class Nametile extends StatelessWidget {
  const Nametile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final tS = MediaQuery.of(context).textScaleFactor;
    return ListTile(
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Colors.black26),
        borderRadius: BorderRadius.circular(5),
      ),
      onTap: () {},
      title: Text(
        'Astar',
        style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 15),
      ),
      leading: Container(
          padding: EdgeInsets.all(size.width * 0.008),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.black26, width: .8)),
          child: Icon(
            Icons.category,
            color: iconColor,
          )),
      trailing: IconButton(
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () {},
      ),
    );
  }
}
