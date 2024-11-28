class SalesModel {
  String id;
  double onlineSaleAmount;
  double cashSaleAmount;
  DateTime date;
  SalesModel(
      {required this.cashSaleAmount,
      required this.onlineSaleAmount,
      required this.id,
      required this.date});


  static fromJson(data) => SalesModel(cashSaleAmount: data['cashAmount'].toDouble(), onlineSaleAmount: data['onlineAmount'].toDouble(), id: data['_id'], date: DateTime.parse(data['date']));
}
