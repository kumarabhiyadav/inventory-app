import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:inventory_app/InventoryModule/models/inventory_models.dart';
import 'package:inventory_app/api.dart';
import 'package:inventory_app/financeModule/model/sales_model.dart';
import 'package:inventory_app/purchaseModule/models/purchase.model.dart';
import 'package:inventory_app/purchaseModule/models/supplier.model.dart';
import 'package:inventory_app/services/http_service.dart';

class PurchaseProvider with ChangeNotifier {
  List<SalesModel> _sales = [];
  List<SalesModel> get sales => [..._sales];
  PurchaseModel? currentPurchaseModel;
  List<PurchaseModel> purchase = [
   
  ];

 
  createSales({required Map<String, String> body}) async {
    final responseBody = await HttpService.postRequest(
        getEndPoint('createSales'), json.encode(body));
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
    
  }

  addSubProduct(SubProductModel subProductModel) {}

  deleteSubProduct(SubProductModel subProductModel) {}
}
