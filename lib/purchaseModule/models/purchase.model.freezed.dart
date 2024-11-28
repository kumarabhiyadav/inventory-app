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
  double get totalCost => throw _privateConstructorUsedError;
  double get additionalCost => throw _privateConstructorUsedError;
  List<PurchaseSubProduct> get subProducts =>
      throw _privateConstructorUsedError;
  DateTime get purchaseDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier')
  SupplierModel get supplier => throw _privateConstructorUsedError;

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
      double totalCost,
      double additionalCost,
      List<PurchaseSubProduct> subProducts,
      DateTime purchaseDate,
      @JsonKey(name: 'supplier') SupplierModel supplier});

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
    Object? totalCost = null,
    Object? additionalCost = null,
    Object? subProducts = null,
    Object? purchaseDate = null,
    Object? supplier = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double,
      additionalCost: null == additionalCost
          ? _value.additionalCost
          : additionalCost // ignore: cast_nullable_to_non_nullable
              as double,
      subProducts: null == subProducts
          ? _value.subProducts
          : subProducts // ignore: cast_nullable_to_non_nullable
              as List<PurchaseSubProduct>,
      purchaseDate: null == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as SupplierModel,
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
      double totalCost,
      double additionalCost,
      List<PurchaseSubProduct> subProducts,
      DateTime purchaseDate,
      @JsonKey(name: 'supplier') SupplierModel supplier});

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
    Object? totalCost = null,
    Object? additionalCost = null,
    Object? subProducts = null,
    Object? purchaseDate = null,
    Object? supplier = null,
  }) {
    return _then(_$PurchaseModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double,
      additionalCost: null == additionalCost
          ? _value.additionalCost
          : additionalCost // ignore: cast_nullable_to_non_nullable
              as double,
      subProducts: null == subProducts
          ? _value._subProducts
          : subProducts // ignore: cast_nullable_to_non_nullable
              as List<PurchaseSubProduct>,
      purchaseDate: null == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as SupplierModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseModelImpl implements _PurchaseModel {
  const _$PurchaseModelImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.totalCost,
      required this.additionalCost,
      required final List<PurchaseSubProduct> subProducts,
      required this.purchaseDate,
      @JsonKey(name: 'supplier') required this.supplier})
      : _subProducts = subProducts;

  factory _$PurchaseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final double totalCost;
  @override
  final double additionalCost;
  final List<PurchaseSubProduct> _subProducts;
  @override
  List<PurchaseSubProduct> get subProducts {
    if (_subProducts is EqualUnmodifiableListView) return _subProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subProducts);
  }

  @override
  final DateTime purchaseDate;
  @override
  @JsonKey(name: 'supplier')
  final SupplierModel supplier;

  @override
  String toString() {
    return 'PurchaseModel(id: $id, totalCost: $totalCost, additionalCost: $additionalCost, subProducts: $subProducts, purchaseDate: $purchaseDate, supplier: $supplier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.additionalCost, additionalCost) ||
                other.additionalCost == additionalCost) &&
            const DeepCollectionEquality()
                .equals(other._subProducts, _subProducts) &&
            (identical(other.purchaseDate, purchaseDate) ||
                other.purchaseDate == purchaseDate) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      totalCost,
      additionalCost,
      const DeepCollectionEquality().hash(_subProducts),
      purchaseDate,
      supplier);

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
          required final double totalCost,
          required final double additionalCost,
          required final List<PurchaseSubProduct> subProducts,
          required final DateTime purchaseDate,
          @JsonKey(name: 'supplier') required final SupplierModel supplier}) =
      _$PurchaseModelImpl;

  factory _PurchaseModel.fromJson(Map<String, dynamic> json) =
      _$PurchaseModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  double get totalCost;
  @override
  double get additionalCost;
  @override
  List<PurchaseSubProduct> get subProducts;
  @override
  DateTime get purchaseDate;
  @override
  @JsonKey(name: 'supplier')
  SupplierModel get supplier;
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
  double get mrp => throw _privateConstructorUsedError;
  double get sellingprice => throw _privateConstructorUsedError;

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
      double mrp,
      double sellingprice});
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
    Object? mrp = null,
    Object? sellingprice = null,
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
      mrp: null == mrp
          ? _value.mrp
          : mrp // ignore: cast_nullable_to_non_nullable
              as double,
      sellingprice: null == sellingprice
          ? _value.sellingprice
          : sellingprice // ignore: cast_nullable_to_non_nullable
              as double,
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
      double mrp,
      double sellingprice});
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
    Object? mrp = null,
    Object? sellingprice = null,
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
      mrp: null == mrp
          ? _value.mrp
          : mrp // ignore: cast_nullable_to_non_nullable
              as double,
      sellingprice: null == sellingprice
          ? _value.sellingprice
          : sellingprice // ignore: cast_nullable_to_non_nullable
              as double,
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
      required this.mrp,
      required this.sellingprice});

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
  final double mrp;
  @override
  final double sellingprice;

  @override
  String toString() {
    return 'PurchaseSubProduct(id: $id, cost: $cost, image: $image, subproduct: $subproduct, name: $name, unit: $unit, quantity: $quantity, mrp: $mrp, sellingprice: $sellingprice)';
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
            (identical(other.mrp, mrp) || other.mrp == mrp) &&
            (identical(other.sellingprice, sellingprice) ||
                other.sellingprice == sellingprice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, cost, image, subproduct,
      name, unit, quantity, mrp, sellingprice);

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
      required final double mrp,
      required final double sellingprice}) = _$PurchaseSubProductImpl;

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
  double get mrp;
  @override
  double get sellingprice;
  @override
  @JsonKey(ignore: true)
  _$$PurchaseSubProductImplCopyWith<_$PurchaseSubProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
