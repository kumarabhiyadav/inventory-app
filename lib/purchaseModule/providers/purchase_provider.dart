import 'package:flutter/foundation.dart';
import 'package:inventory_app/InventoryModule/models/inventory_models.dart';
import 'package:inventory_app/purchaseModule/models/purchase_model.dart';

class PurchaseProvider with ChangeNotifier {
  List<PurchaseModel> purchase = [
    PurchaseModel(
        additionalCost: 100,
        subproducts: [
          PurchaseSubproduct(
              cost: 100.00,
              quantity: 10.0,
              subProduct: SubProductModel(id: "1", name: "Lace"))
        ],
        supplier: SupplierModel(address: "Thane West", name: "Ramdev"))
  ];
}
