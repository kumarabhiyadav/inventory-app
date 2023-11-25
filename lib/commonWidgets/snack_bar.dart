import 'package:flutter/material.dart';

void showSnackBar({required BuildContext context,required String title}) {
    final snackBar =  SnackBar(
      duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,

        margin: const EdgeInsets.symmetric(horizontal:10,vertical: 10),
      content: Container (
        // padding: const EdgeInsets.all(2),
        child: Text(title,style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600,color: Colors.white))),
      backgroundColor: Colors.black,
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        )
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }