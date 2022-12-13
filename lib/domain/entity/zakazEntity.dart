class ZakazEntity {
  late int id;
  final int employeeId;
  final int productId;
  final String date;
  final int count;

  ZakazEntity(
      {required this.employeeId,
      required this.productId,
      required this.date,
      required this.count});
}
