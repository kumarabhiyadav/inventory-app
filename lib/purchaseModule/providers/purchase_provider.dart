import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:inventory_app/InventoryModule/models/inventory_models.dart';
import 'package:inventory_app/api.dart';
import 'package:inventory_app/financeModule/model/sales_model.dart';
import 'package:inventory_app/purchaseModule/models/purchase_model.dart';
import 'package:inventory_app/services/http_service.dart';

class PurchaseProvider with ChangeNotifier {
  List<SalesModel> _sales = [];
  List<SalesModel> get sales => [..._sales];
  PurchaseModel? currentPurchaseModel;
  List<PurchaseModel> purchase = [
    PurchaseModel(
        additionalCost: 100,
        subproducts: [
          PurchaseSubproduct(
              cost: 99.00,
              quantity: 1.0,
              unit: 'Meter',
              image: "https://picsum.photos/200",
              subProduct: SubProductModel(
                  id: "1", name: "Lace", category: "", product: "")),
          PurchaseSubproduct(
              cost: 1.00,
              quantity: 1.0,
              image: "",
              unit: "Numbers",
              subProduct: SubProductModel(
                  id: "1", name: "Lace", category: "", product: "")),
        ],
        supplier:
            SupplierModel(id: "12", address: "Thane West", name: "Ramdev"),
        date: DateTime.now())
  ];

  List<SupplierModel> suppliers = [
    SupplierModel(id: '122', address: "Thane (w)", name: 'Ramdev Lace')
  ];

  createSales({required Map<String, String> body}) async {
    final responseBody = await HttpService.postRequest(
        getEndPoint('createSales'), json.encode(body));
    print(responseBody);
    if (responseBody != null) {
      _sales.insert(0, SalesModel.fromJson(responseBody['result']));
      notifyListeners();
    }
  }

  fetchSales() async {
    _sales = [];
    final responseBody =
        await HttpService.getRequest(getEndPoint('fetchSales'));
    if (responseBody != null) {
      responseBody['result']
          .forEach((data) => _sales.add(SalesModel.fromJson(data)));
      notifyListeners();
    }
  }

  inistate(SupplierModel supplier) {
    currentPurchaseModel = PurchaseModel(
        additionalCost: 0.0,
        subproducts: [],
        supplier: supplier,
        date: DateTime.now());
        notifyListeners();
  }

  addSubProduct(SubProductModel subProductModel) {}

  deleteSubProduct(SubProductModel subProductModel) {}
}
