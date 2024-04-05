import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:inventory_app/InventoryModule/models/inventory_models.dart';
import 'package:inventory_app/api.dart';
import 'package:inventory_app/services/http_service.dart';

class InventoryProvider with ChangeNotifier {
  List<CategoryModel> categories = [];
  List<ProductModel> products = [];
  List<SubProductModel> subProducts = [];

  createCategory({required String name}) async {
    final response = await HttpService.postRequest(
        getEndPoint('createCategory'), jsonEncode({"name": name}));
    return response;
  }

   createProduct({required String name,required CategoryModel categoryModel}) async {
    final response = await HttpService.postRequest(
        getEndPoint('createProduct'), jsonEncode({"name": name,'category':categoryModel.id}));
    return response;
  }

   createSubProduct({required String name,required CategoryModel categoryModel,required ProductModel productModel}) async {
    final response = await HttpService.postRequest(
        getEndPoint('createSubProduct'), jsonEncode({"name": name,'category':categoryModel.id,'product':productModel.id}));
    return response;
  }

  fetchCategories() async {
    categories = [];
    final response =
        await HttpService.getRequest(getEndPoint('fetchCategories'));
        response['result'].forEach((category) => {
          categories
              .add(CategoryModel(id: category['_id'], name: category['name']))
        });
    notifyListeners();
    // return response;
  }
  fetchProducts(categoryId) async {
    products = [];
    final response =
        await HttpService.getRequest("${getEndPoint('fetchProducts')}/category/$categoryId");
        response['result'].forEach((product) => {
          products
              .add(ProductModel(id: product['_id'], name: product['name'],category: product['category']))
        });
    notifyListeners();
  }
  fetchSubProducts(productId) async {
    subProducts = [];
    final response =
        await HttpService.getRequest("${getEndPoint('fetchSubProducts')}/product/$productId");
        response['result'].forEach((subProduct) => {
          subProducts
              .add(SubProductModel(id: subProduct['_id'], name: subProduct['name'],category: subProduct['category'],product: subProduct['product']))
        });
    notifyListeners();
  }
}
