import 'package:inventory_app/InventoryModule/models/inventory_models.dart';

class PurchaseSubproduct {
  final double quantity;
  final double cost;
  final String image;
  final String unit;

  final SubProductModel subProduct;
  PurchaseSubproduct(
      {required this.cost,
      required this.quantity,
      required this.subProduct,
      required this.unit,
      required this.image});
}

class PurchaseModel {
  double additionalCost;
  List<PurchaseSubproduct> subproducts;
  SupplierModel supplier;
  DateTime date;

  PurchaseModel(
      {required this.additionalCost,
      required this.subproducts,
      required this.supplier,
      required this.date});

  double getTotalOfSubProducts() {
    double total = 0.0;
    for (var prod in subproducts) {
      total += prod.cost;
    }
    return total;
  }

  rateWithExtraCost({
    required PurchaseSubproduct subProduct,
  }) {
    double percentageContribution = 0.0;
    percentageContribution = (subProduct.cost * 100) / getTotalOfSubProducts();

    return (subProduct.cost / subProduct.quantity) +
        ((additionalCost * percentageContribution) / 100);
  }
}

class SupplierModel {
  String id;
  String name;
  String address;
  SupplierModel({required this.id, required this.address, required this.name});
}
