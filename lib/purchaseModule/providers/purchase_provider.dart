import 'package:flutter/foundation.dart';
import 'package:inventory_app/InventoryModule/models/inventory_models.dart';
import 'package:inventory_app/purchaseModule/models/purchase_model.dart';

class PurchaseProvider with ChangeNotifier {
  List<PurchaseModel> purchase = [
    PurchaseModel(
        additionalCost: 100,
        subproducts: [
          PurchaseSubproduct(
              cost: 99.00,
              quantity: 1.0,
              unit: 'Meter',
              image: "https://picsum.photos/200",
              subProduct: SubProductModel(id: "1", name: "Lace")),
          PurchaseSubproduct(
              cost: 1.00,
              quantity: 1.0,
              image: "",
              unit: "Numbers",
              subProduct: SubProductModel(id: "1", name: "Lace")),
        ],
        supplier:
            SupplierModel(id: "12", address: "Thane West", name: "Ramdev"),
        date: DateTime.now())
  ];

  List<SupplierModel> suppliers = [
    SupplierModel(id: '122', address: "Thane (w)", name: 'Ramdev Lace')
  ];
}
