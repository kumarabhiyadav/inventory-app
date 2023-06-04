import 'package:flutter/foundation.dart';
import 'package:inventory_app/InventoryModule/models/inventory_models.dart';

class InventoryProvider with ChangeNotifier {
  List<CategoryModel> categories = [
    CategoryModel(id: '1', name: 'Cloths'),
    CategoryModel(id: '2', name: 'Cosmetic'),
  ];
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
}
