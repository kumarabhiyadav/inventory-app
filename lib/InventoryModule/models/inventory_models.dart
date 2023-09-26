class CategoryModel {
  final String id;
  String name;
  String imagePath = "assets/svgs/category.svg";
  CategoryModel({required this.id, required this.name});
}

class ProductModel {
  final String id;
  String name;
  String imagePath = "assets/svgs/product.svg";

  ProductModel({required this.id, required this.name});
}

class SubProductModel {
  final String id;
  String name;
  String imagePath = "assets/svgs/subproduct.svg";

  SubProductModel({required this.id, required this.name});
}
