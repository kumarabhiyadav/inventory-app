import 'package:flutter/material.dart';
import 'package:inventory_app/home/home_screen.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key,required this.message});
  final String  message;

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) =>const HomeScreen()),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              decoration:  BoxDecoration(color: Theme.of(context).primaryColor,
              shape: BoxShape.circle),
              padding: EdgeInsets.all(size.width * 0.02),
              child: const Icon(
                Icons.done,
                size: 50,
                color: Colors.white ,
              )),

              Container
              
              (
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(widget.message,style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),))
        ],
      ),
    );
  }
}
