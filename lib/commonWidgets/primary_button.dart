import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      required this.function,
      required this.height,
      required this.title,
      required this.width,
      this.icon})
      : super(key: key);
  final double height;
  final double width;
  final String title;
  final Function function;
  final Widget? icon;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => function(),
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w400),
              ),
              icon ?? const SizedBox.shrink()
            ],
          ),
        ),
      );
}
