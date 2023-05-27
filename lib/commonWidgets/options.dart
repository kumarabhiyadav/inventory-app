import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../colors.dart';

class Options extends StatelessWidget {
  const Options(
      {Key? key,
      required this.size,
      required this.icon,
      required this.subTitle,
      required this.title,
      required this.function})
      : super(key: key);

  final Size size;
  final String title;
  final String icon;
  final String subTitle;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.purple,
      child: InkWell(
        onTap: () => function(),
        child: Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(size.width * 0.02),
          height: size.height * 0.2,
          width: size.width * 0.4,
          decoration: BoxDecoration(
              border: Border.all(color: iconColor, width: .5),
              borderRadius: BorderRadius.circular(8),
              // gradient: LinearGradient(colors: [
              //   iconColor.withOpacity(1),
              //   iconColor.withOpacity(.8),
              //   Colors.purple.withOpacity(0.2),
              // ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              color: iconColor.withOpacity(0.8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                icon,
                width: 20,
                height: 20,
                color: Colors.white,
              ),
              SizedBox(
                height: size.width * 0.02,
              ),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.white),
              ),
              SizedBox(
                height: size.width * 0.01,
              ),
              Text(
                subTitle,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
