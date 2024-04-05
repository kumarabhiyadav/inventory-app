class CategoryModel {
  final String id;
  String name;
  String imagePath = "assets/svgs/category.svg";
  CategoryModel({required this.id, required this.name});

  
 static fromJson(data) => CategoryModel(id: data['_id'], name: data['name']);
}

class ProductModel {
  final String id;
  String name;
  String imagePath = "assets/svgs/product.svg";
  String category;

  ProductModel({required this.id, required this.name,required this.category});
}

class SubProductModel {
  final String id;
  String name;
  String imagePath = "assets/svgs/subproduct.svg";
  String category;
  String product;

  SubProductModel({required this.id, required this.name,required this.category,required this.product});
}
