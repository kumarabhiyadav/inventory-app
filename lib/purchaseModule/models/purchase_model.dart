import 'package:inventory_app/InventoryModule/models/inventory_models.dart';

class PurchaseSubproduct {
  final double quantity;
  final double cost;
  final SubProductModel subProduct;
  PurchaseSubproduct(
      {required this.cost, required this.quantity, required this.subProduct});
}

class PurchaseModel {
  double additionalCost;
  List<PurchaseSubproduct> subproducts;
  SupplierModel supplier;

  PurchaseModel(
      {required this.additionalCost,
      required this.subproducts,
      required this.supplier});
}

class SupplierModel {
  String name;
  String address;
  SupplierModel({required this.address, required this.name});
}
