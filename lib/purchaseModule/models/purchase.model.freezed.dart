// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PurchaseModel _$PurchaseModelFromJson(Map<String, dynamic> json) {
  return _PurchaseModel.fromJson(json);
}

/// @nodoc
mixin _$PurchaseModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  List<PurchaseSubProduct> get subProdut => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier')
  SupplierModel get supplier => throw _privateConstructorUsedError;
  bool get is_deleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurchaseModelCopyWith<PurchaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseModelCopyWith<$Res> {
  factory $PurchaseModelCopyWith(
          PurchaseModel value, $Res Function(PurchaseModel) then) =
      _$PurchaseModelCopyWithImpl<$Res, PurchaseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      double quantity,
      double cost,
      String image,
      String unit,
      List<PurchaseSubProduct> subProdut,
      DateTime createdAt,
      @JsonKey(name: 'supplier') SupplierModel supplier,
      bool is_deleted});

  $SupplierModelCopyWith<$Res> get supplier;
}

/// @nodoc
class _$PurchaseModelCopyWithImpl<$Res, $Val extends PurchaseModel>
    implements $PurchaseModelCopyWith<$Res> {
  _$PurchaseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? cost = null,
    Object? image = null,
    Object? unit = null,
    Object? subProdut = null,
    Object? createdAt = null,
    Object? supplier = null,
    Object? is_deleted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      subProdut: null == subProdut
          ? _value.subProdut
          : subProdut // ignore: cast_nullable_to_non_nullable
              as List<PurchaseSubProduct>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as SupplierModel,
      is_deleted: null == is_deleted
          ? _value.is_deleted
          : is_deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SupplierModelCopyWith<$Res> get supplier {
    return $SupplierModelCopyWith<$Res>(_value.supplier, (value) {
      return _then(_value.copyWith(supplier: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PurchaseModelImplCopyWith<$Res>
    implements $PurchaseModelCopyWith<$Res> {
  factory _$$PurchaseModelImplCopyWith(
          _$PurchaseModelImpl value, $Res Function(_$PurchaseModelImpl) then) =
      __$$PurchaseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      double quantity,
      double cost,
      String image,
      String unit,
      List<PurchaseSubProduct> subProdut,
      DateTime createdAt,
      @JsonKey(name: 'supplier') SupplierModel supplier,
      bool is_deleted});

  @override
  $SupplierModelCopyWith<$Res> get supplier;
}

/// @nodoc
class __$$PurchaseModelImplCopyWithImpl<$Res>
    extends _$PurchaseModelCopyWithImpl<$Res, _$PurchaseModelImpl>
    implements _$$PurchaseModelImplCopyWith<$Res> {
  __$$PurchaseModelImplCopyWithImpl(
      _$PurchaseModelImpl _value, $Res Function(_$PurchaseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? cost = null,
    Object? image = null,
    Object? unit = null,
    Object? subProdut = null,
    Object? createdAt = null,
    Object? supplier = null,
    Object? is_deleted = null,
  }) {
    return _then(_$PurchaseModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      subProdut: null == subProdut
          ? _value._subProdut
          : subProdut // ignore: cast_nullable_to_non_nullable
              as List<PurchaseSubProduct>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as SupplierModel,
      is_deleted: null == is_deleted
          ? _value.is_deleted
          : is_deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseModelImpl implements _PurchaseModel {
  const _$PurchaseModelImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.quantity,
      required this.cost,
      required this.image,
      required this.unit,
      required final List<PurchaseSubProduct> subProdut,
      required this.createdAt,
      @JsonKey(name: 'supplier') required this.supplier,
      required this.is_deleted})
      : _subProdut = subProdut;

  factory _$PurchaseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final double quantity;
  @override
  final double cost;
  @override
  final String image;
  @override
  final String unit;
  final List<PurchaseSubProduct> _subProdut;
  @override
  List<PurchaseSubProduct> get subProdut {
    if (_subProdut is EqualUnmodifiableListView) return _subProdut;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subProdut);
  }

  @override
  final DateTime createdAt;
  @override
  @JsonKey(name: 'supplier')
  final SupplierModel supplier;
  @override
  final bool is_deleted;

  @override
  String toString() {
    return 'PurchaseModel(id: $id, quantity: $quantity, cost: $cost, image: $image, unit: $unit, subProdut: $subProdut, createdAt: $createdAt, supplier: $supplier, is_deleted: $is_deleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            const DeepCollectionEquality()
                .equals(other._subProdut, _subProdut) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            (identical(other.is_deleted, is_deleted) ||
                other.is_deleted == is_deleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      quantity,
      cost,
      image,
      unit,
      const DeepCollectionEquality().hash(_subProdut),
      createdAt,
      supplier,
      is_deleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseModelImplCopyWith<_$PurchaseModelImpl> get copyWith =>
      __$$PurchaseModelImplCopyWithImpl<_$PurchaseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseModelImplToJson(
      this,
    );
  }
}

abstract class _PurchaseModel implements PurchaseModel {
  const factory _PurchaseModel(
      {@JsonKey(name: '_id') required final String id,
      required final double quantity,
      required final double cost,
      required final String image,
      required final String unit,
      required final List<PurchaseSubProduct> subProdut,
      required final DateTime createdAt,
      @JsonKey(name: 'supplier') required final SupplierModel supplier,
      required final bool is_deleted}) = _$PurchaseModelImpl;

  factory _PurchaseModel.fromJson(Map<String, dynamic> json) =
      _$PurchaseModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  double get quantity;
  @override
  double get cost;
  @override
  String get image;
  @override
  String get unit;
  @override
  List<PurchaseSubProduct> get subProdut;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(name: 'supplier')
  SupplierModel get supplier;
  @override
  bool get is_deleted;
  @override
  @JsonKey(ignore: true)
  _$$PurchaseModelImplCopyWith<_$PurchaseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PurchaseSubProduct _$PurchaseSubProductFromJson(Map<String, dynamic> json) {
  return _PurchaseSubProduct.fromJson(json);
}

/// @nodoc
mixin _$PurchaseSubProduct {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'subproduct')
  String get subproduct => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurchaseSubProductCopyWith<PurchaseSubProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseSubProductCopyWith<$Res> {
  factory $PurchaseSubProductCopyWith(
          PurchaseSubProduct value, $Res Function(PurchaseSubProduct) then) =
      _$PurchaseSubProductCopyWithImpl<$Res, PurchaseSubProduct>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      double cost,
      String image,
      @JsonKey(name: 'subproduct') String subproduct,
      @JsonKey(name: 'name') String name,
      String unit,
      double quantity,
      bool isDeleted});
}

/// @nodoc
class _$PurchaseSubProductCopyWithImpl<$Res, $Val extends PurchaseSubProduct>
    implements $PurchaseSubProductCopyWith<$Res> {
  _$PurchaseSubProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cost = null,
    Object? image = null,
    Object? subproduct = null,
    Object? name = null,
    Object? unit = null,
    Object? quantity = null,
    Object? isDeleted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      subproduct: null == subproduct
          ? _value.subproduct
          : subproduct // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurchaseSubProductImplCopyWith<$Res>
    implements $PurchaseSubProductCopyWith<$Res> {
  factory _$$PurchaseSubProductImplCopyWith(_$PurchaseSubProductImpl value,
          $Res Function(_$PurchaseSubProductImpl) then) =
      __$$PurchaseSubProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      double cost,
      String image,
      @JsonKey(name: 'subproduct') String subproduct,
      @JsonKey(name: 'name') String name,
      String unit,
      double quantity,
      bool isDeleted});
}

/// @nodoc
class __$$PurchaseSubProductImplCopyWithImpl<$Res>
    extends _$PurchaseSubProductCopyWithImpl<$Res, _$PurchaseSubProductImpl>
    implements _$$PurchaseSubProductImplCopyWith<$Res> {
  __$$PurchaseSubProductImplCopyWithImpl(_$PurchaseSubProductImpl _value,
      $Res Function(_$PurchaseSubProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cost = null,
    Object? image = null,
    Object? subproduct = null,
    Object? name = null,
    Object? unit = null,
    Object? quantity = null,
    Object? isDeleted = null,
  }) {
    return _then(_$PurchaseSubProductImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      subproduct: null == subproduct
          ? _value.subproduct
          : subproduct // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseSubProductImpl implements _PurchaseSubProduct {
  const _$PurchaseSubProductImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.cost,
      required this.image,
      @JsonKey(name: 'subproduct') required this.subproduct,
      @JsonKey(name: 'name') required this.name,
      required this.unit,
      required this.quantity,
      required this.isDeleted});

  factory _$PurchaseSubProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseSubProductImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final double cost;
  @override
  final String image;
  @override
  @JsonKey(name: 'subproduct')
  final String subproduct;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  final String unit;
  @override
  final double quantity;
  @override
  final bool isDeleted;

  @override
  String toString() {
    return 'PurchaseSubProduct(id: $id, cost: $cost, image: $image, subproduct: $subproduct, name: $name, unit: $unit, quantity: $quantity, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseSubProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.subproduct, subproduct) ||
                other.subproduct == subproduct) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, cost, image, subproduct,
      name, unit, quantity, isDeleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseSubProductImplCopyWith<_$PurchaseSubProductImpl> get copyWith =>
      __$$PurchaseSubProductImplCopyWithImpl<_$PurchaseSubProductImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseSubProductImplToJson(
      this,
    );
  }
}

abstract class _PurchaseSubProduct implements PurchaseSubProduct {
  const factory _PurchaseSubProduct(
      {@JsonKey(name: '_id') required final String id,
      required final double cost,
      required final String image,
      @JsonKey(name: 'subproduct') required final String subproduct,
      @JsonKey(name: 'name') required final String name,
      required final String unit,
      required final double quantity,
      required final bool isDeleted}) = _$PurchaseSubProductImpl;

  factory _PurchaseSubProduct.fromJson(Map<String, dynamic> json) =
      _$PurchaseSubProductImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  double get cost;
  @override
  String get image;
  @override
  @JsonKey(name: 'subproduct')
  String get subproduct;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  String get unit;
  @override
  double get quantity;
  @override
  bool get isDeleted;
  @override
  @JsonKey(ignore: true)
  _$$PurchaseSubProductImplCopyWith<_$PurchaseSubProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
