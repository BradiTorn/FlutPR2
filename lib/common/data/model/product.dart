import 'package:pr_2/domain/entity/productEntity.dart';

class Product extends ProductEntity {
  late int id;
  final String productName;
  final String description;
  final int providerId;
  final int categoryId;
  final int price;
  final int count;

  Product({
    required this.productName,
    required this.description,
    required this.providerId,
    required this.categoryId,
    required this.price,
    required this.count,
  }) : super(
          productName: productName,
          description: description,
          providerId: providerId,
          categoryId: categoryId,
          price: price,
          count: count,
        );

  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'description': description,
      'providerId': providerId,
      'categoryId': categoryId,
      'price': price,
      'count': count,
    };
  }

  factory Product.toFromMap(Map<String, dynamic> json) {
    return Product(
      productName: json['productName'],
      description: json['description'],
      providerId: json['providerId'],
      categoryId: json['categoryId'],
      price: json['price'],
      count: json['count'],
    );
  }
}
