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
}
