import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inventory_app/font_size.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.title, this.leading})
      : super(key: key);
  final String title;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final tS = MediaQuery.of(context).textScaleFactor;

    return PreferredSize(
        preferredSize: size * 0.5,
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leadingWidth: size.width * 0.2,
          leading: leading ??
              Material(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  splashColor: Colors.purple.withOpacity(.3),
                  child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                          vertical: size.width * 0.02),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black12,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Theme.of(context).primaryColor,
                        size: 18,
                      )),
                ),
              ),
          title: Text(
            title,
            style: TextStyle(
                fontSize: tS * h4,
                color: Theme.of(context).primaryColor,
                letterSpacing: .72,
                fontWeight: FontWeight.w600),
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
