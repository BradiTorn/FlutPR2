import 'package:pr_2/domain/entity/productInCellEntity.dart';

class ProductInCell extends ProductInCellEntity {
  late int id;
  final int productId;
  final int cellId;

  ProductInCell({
    required this.productId,
    required this.cellId,
  }) : super(
          productId: productId,
          cellId: cellId,
        );

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'cellId': cellId,
    };
  }

  factory ProductInCell.toFromMap(Map<String, dynamic> json) {
    return ProductInCell(
      productId: json['productId'],
      cellId: json['cellId'],
    );
  }
}
