// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SupplierModelImpl _$$SupplierModelImplFromJson(Map<String, dynamic> json) =>
    _$SupplierModelImpl(
      id: json['_id'] as String?,
      name: json['name'] as String,
      address: json['address'] as String,
      mobile: json['mobile'] as String,
      isDeleted: json['isDeleted'] as bool,
    );

Map<String, dynamic> _$$SupplierModelImplToJson(_$SupplierModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'mobile': instance.mobile,
      'isDeleted': instance.isDeleted,
    };
