import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:inventory_app/InventoryModule/models/inventory_models.dart';
import 'package:inventory_app/api.dart';
import 'package:inventory_app/services/http_service.dart';

class InventoryProvider with ChangeNotifier {
  List<CategoryModel> categories = [];

  List<ProductModel> products = [
    ProductModel(id: '1', name: 'Inner Garments'),
    ProductModel(id: '2', name: 'Eye Liner'),
  ];
  List<SubProductModel> subProducts = [
    SubProductModel(id: '1', name: 'Garment 1'),
    SubProductModel(id: '2', name: 'Lakme'),
    SubProductModel(id: '1', name: 'Garment 1'),
    SubProductModel(id: '2', name: 'Lakme'),
    SubProductModel(id: '1', name: 'Garment 1'),
    SubProductModel(id: '2', name: 'Lakme'),
    SubProductModel(id: '1', name: 'Garment 1'),
    SubProductModel(id: '2', name: 'Lakme'),
    SubProductModel(id: '1', name: 'Garment 1'),
    SubProductModel(id: '2', name: 'Lakme'),
    SubProductModel(id: '1', name: 'Garment 1'),
    SubProductModel(id: '2', name: 'Lakme'),
  ];

  createCategory({required String name}) async {
    final response = await HttpService.postRequest(
        getEndPoint('createCategory'), jsonEncode({"name": name}));
    return response;
  }

  fetchCategory() async {
    final response =
        await HttpService.getRequest(getEndPoint('fetchCategories'));

    response.forEach((category) => {
          categories
              .add(CategoryModel(id: category['id'], name: category['name']))
        });

    notifyListeners();
    // return response;
  }
}
