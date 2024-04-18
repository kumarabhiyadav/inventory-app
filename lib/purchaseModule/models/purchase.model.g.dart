// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseModelImpl _$$PurchaseModelImplFromJson(Map<String, dynamic> json) =>
    _$PurchaseModelImpl(
      id: json['_id'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      cost: (json['cost'] as num).toDouble(),
      image: json['image'] as String,
      unit: json['unit'] as String,
      subProdut: (json['subProdut'] as List<dynamic>)
          .map((e) => PurchaseSubProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      supplier:
          SupplierModel.fromJson(json['supplier'] as Map<String, dynamic>),
      is_deleted: json['is_deleted'] as bool,
    );

Map<String, dynamic> _$$PurchaseModelImplToJson(_$PurchaseModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'quantity': instance.quantity,
      'cost': instance.cost,
      'image': instance.image,
      'unit': instance.unit,
      'subProdut': instance.subProdut,
      'createdAt': instance.createdAt.toIso8601String(),
      'supplier': instance.supplier,
      'is_deleted': instance.is_deleted,
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
      isDeleted: json['isDeleted'] as bool,
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
      'isDeleted': instance.isDeleted,
    };
