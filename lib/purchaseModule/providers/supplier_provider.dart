import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:inventory_app/api.dart';
import 'package:inventory_app/purchaseModule/models/supplier.model.dart';
import 'package:inventory_app/services/http_service.dart';

class SupplierProvider with ChangeNotifier {
  List<SupplierModel> _suppliers = [];

  List<SupplierModel> filteredList = [];

  List<SupplierModel> get suppliers => [..._suppliers];

  void searchSupplier(String key ){
    if(key == "") {
      filteredList = _suppliers;
      notifyListeners();
      return;
       }
     filteredList =  _suppliers.where((supplier) => supplier.name.toLowerCase().contains(key.toLowerCase()) || supplier.address.toLowerCase().contains(key.toLowerCase())).toList();
     notifyListeners();

  }


  createSupplier({required Map<String, String> body}) async {
    final responseData = await HttpService.postRequest(
        getEndPoint('createSupplier'), json.encode(body));
    if (responseData != null) {
      _suppliers.insert(0, SupplierModel.fromJson(responseData['result']));
      notifyListeners();
    }
  }

  fetchSuppliers() async {
    final responseData =
        await HttpService.getRequest(getEndPoint('fetchSupplier'));
    if (responseData != null) {
      _suppliers = [];
      responseData['result']
          .forEach((data) => _suppliers.add(SupplierModel.fromJson(data)));

          filteredList = _suppliers;
      notifyListeners();
    }
  }
}
