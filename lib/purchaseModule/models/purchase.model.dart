import 'package:freezed_annotation/freezed_annotation.dart';
import 'supplier.model.dart';
part 'purchase.model.freezed.dart';
part 'purchase.model.g.dart';

@freezed
class PurchaseModel with _$PurchaseModel {
  const factory PurchaseModel({
    @JsonKey(name: '_id') required final String id,
    required final double totalCost,
    required final double additionalCost,
    required final List<PurchaseSubProduct> subProducts,
    required final DateTime purchaseDate,
    @JsonKey(name: 'supplier') required SupplierModel supplier,
  }) = _PurchaseModel;

  factory PurchaseModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseModelFromJson(json);
}

@freezed
class PurchaseSubProduct with _$PurchaseSubProduct {
  const factory PurchaseSubProduct({
    @JsonKey(name: '_id') required String id,
    required double cost,
    required String? image,
    @JsonKey(name: 'subproduct') required String subproduct,
    @JsonKey(name: 'name') required String name,
    required String unit,
    required double quantity,
    required double mrp,
    required double sellingprice,
  }) = _PurchaseSubProduct;

  factory PurchaseSubProduct.fromJson(Map<String, dynamic> json) =>
      _$PurchaseSubProductFromJson(json);
}





// import 'package:inventory_app/InventoryModule/models/inventory_models.dart';

// class PurchaseSubproduct {
//   final double quantity;
//   final double cost;
//   final String image;
//   final String unit;

//   final SubProductModel subProduct;
//   PurchaseSubproduct(
//       {required this.cost,
//       required this.quantity,
//       required this.subProduct,
//       required this.unit,
//       required this.image});
// }

// class PurchaseModel {
//   double additionalCost;
//   List<PurchaseSubproduct> subproducts;
//   SupplierModel supplier;
//   DateTime date;

//   PurchaseModel(
//       {required this.additionalCost,
//       required this.subproducts,
//       required this.supplier,
//       required this.date});

//   double getTotalOfSubProducts() {
//     double total = 0.0;
//     for (var prod in subproducts) {
//       total += prod.cost;
//     }
//     return total;
//   }

//   rateWithExtraCost({
//     required PurchaseSubproduct subProduct,
//   }) {
//     double percentageContribution = 0.0;
//     percentageContribution = (subProduct.cost * 100) / getTotalOfSubProducts();

//     return (subProduct.cost / subProduct.quantity) +
//         ((additionalCost * percentageContribution) / 100);
//   }
// }


