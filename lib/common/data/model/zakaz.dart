import 'package:pr_2/domain/entity/zakazEntity.dart';

class Zakaz extends ZakazEntity {
  late int id;
  final int employeeId;
  final int productId;
  final String date;
  final int count;

  Zakaz({
    required this.employeeId,
    required this.productId,
    required this.date,
    required this.count,
  }) : super(
          employeeId: employeeId,
          productId: productId,
          date: date,
          count: count,
        );

  Map<String, dynamic> toMap() {
    return {
      'employeeId': employeeId,
      'productId': productId,
      'date': date,
      'count': count,
    };
  }

  factory Zakaz.toFromMap(Map<String, dynamic> json) {
    return Zakaz(
      employeeId: json['employeeId'],
      productId: json['productId'],
      date: json['date'],
      count: json['count'],
    );
  }
}
