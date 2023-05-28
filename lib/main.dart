import 'package:flutter/material.dart';
import 'package:inventory_app/InventoryModule/providers/inventory_provider.dart';
import 'package:inventory_app/font_size.dart';
import 'package:inventory_app/home/home_screen.dart';
import 'package:inventory_app/purchaseModule/providers/purchase_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InventoryProvider()),
        ChangeNotifierProvider(create: (_) => PurchaseProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.black87,
          fontFamily: 'Lato',
          textTheme: TextTheme(
            headline5: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
              letterSpacing: .67,
              fontSize: h3,
            ),
            subtitle1: const TextStyle(
              fontWeight: FontWeight.w500,
              letterSpacing: .67,
            ),
            subtitle2: const TextStyle(
              fontWeight: FontWeight.w500,
              letterSpacing: .67,
            ),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
