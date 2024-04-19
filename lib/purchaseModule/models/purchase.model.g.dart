// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseModelImpl _$$PurchaseModelImplFromJson(Map<String, dynamic> json) =>
    _$PurchaseModelImpl(
      id: json['_id'] as String,
      totalCost: (json['totalCost'] as num).toDouble(),
      additionalCost: (json['additionalCost'] as num).toDouble(),
      subProdut: (json['subProdut'] as List<dynamic>)
          .map((e) => PurchaseSubProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      supplier:
          SupplierModel.fromJson(json['supplier'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PurchaseModelImplToJson(_$PurchaseModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'totalCost': instance.totalCost,
      'additionalCost': instance.additionalCost,
      'subProdut': instance.subProdut,
      'createdAt': instance.createdAt.toIso8601String(),
      'supplier': instance.supplier,
    };

_$PurchaseSubProductImpl _$$PurchaseSubProductImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseSubProductImpl(
      id: json['_id'] as String,
      cost: (json['cost'] as num).toDouble(),
      image: json['image'] as String,
      subproduct: json['subproduct'] as String,
      name: json['name'] as String,
      unit: json['unit'] as String,
      quantity: (json['quantity'] as num).toDouble(),
    );

Map<String, dynamic> _$$PurchaseSubProductImplToJson(
        _$PurchaseSubProductImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'cost': instance.cost,
      'image': instance.image,
      'subproduct': instance.subproduct,
      'name': instance.name,
      'unit': instance.unit,
      'quantity': instance.quantity,
    };
