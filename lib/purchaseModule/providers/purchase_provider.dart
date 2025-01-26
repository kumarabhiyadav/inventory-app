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
  List<PurchaseModel> purchase = [];
  List<dynamic> subProductpurchase = [];

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
    currentPurchaseModel = PurchaseModel(
        additionalCost: 0.0,
        id: '',
        purchaseDate: DateTime.now(),
        subProducts: [],
        supplier: supplier,
        totalCost: 0.0);
    print(currentPurchaseModel);
  }

  addSubProductForPurchase(PurchaseSubProduct purchaseSubProduct) {
    List<PurchaseSubProduct> subproducts = [
      ...currentPurchaseModel!.subProducts
    ];
    subproducts.add(purchaseSubProduct);
    currentPurchaseModel = currentPurchaseModel!.copyWith(
        totalCost: currentPurchaseModel!.totalCost +
            (purchaseSubProduct.quantity * purchaseSubProduct.cost));
    currentPurchaseModel =
        currentPurchaseModel!.copyWith(subProducts: subproducts);
    notifyListeners();
  }

  deleteSubProductForPurchase(PurchaseSubProduct purchaseSubProduct) {
    List<PurchaseSubProduct> subproducts = [
      ...currentPurchaseModel!.subProducts
    ];
    currentPurchaseModel = currentPurchaseModel!.copyWith(
        totalCost: currentPurchaseModel!.totalCost -
            (purchaseSubProduct.quantity * purchaseSubProduct.cost));

    subproducts
        .removeWhere((p) => p.subproduct == purchaseSubProduct.subproduct);
    currentPurchaseModel =
        currentPurchaseModel!.copyWith(subProducts: subproducts);
    notifyListeners();
  }

  createPurchase() async {
    Map<String, dynamic> body = {};
    Map<String, String> images = {};

    if (currentPurchaseModel != null) {
      for (var subproduct in currentPurchaseModel!.subProducts) {
        if (subproduct.image != "") {
          images[subproduct.subproduct] = subproduct.image ?? '';
        }
      }
    }
    final respone = await HttpService.postWithFiles(
        getEndPoint('createPurchase'),
        jsonEncode(currentPurchaseModel!.toJson()),
        images);

    if (respone != null) {
      currentPurchaseModel = null;
      return respone;
    }
    return null;
  }

  fetchPurchases() async {
    purchase = [];
    final response = await HttpService.getRequest(getEndPoint('fetchPurchase'));

    if (response != null) {
      response['result']
          .forEach((e) => {purchase.add(PurchaseModel.fromJson(e))});
      notifyListeners();
    }
  }

  deletePurchase(id) async {
    final response =
        await HttpService.delete('${getEndPoint('deletePurchase')}/' + id);
    print(response);
    if (response != null) {
      purchase.removeWhere((element) => element.id == id);
      notifyListeners();
    }
  }

  fetchSubProductPurchases({required String id}) async {
    subProductpurchase = [];

    print("${getEndPoint('fetchSubProductPurchase')}/$id");
    final response = await HttpService.getRequest(
        "${getEndPoint('fetchSubProductPurchase')}/$id");

    if (response != null) {
      response['result'].forEach((e) => {subProductpurchase.add(e)});
      print(subProductpurchase);
      notifyListeners();
    }
  }
}
