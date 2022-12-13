import 'package:pr_2/domain/entity/categoryEntity.dart';

class Category extends CategoryEntity {
  late int id;
  final String categoryName;

  Category({required this.categoryName}) : super(categoryName: categoryName);

  Map<String, dynamic> toMap() {
    return {
      'categoryName': categoryName,
    };
  }

  factory Category.toFromMap(Map<String, dynamic> json) {
    return Category(categoryName: json['categoryName']);
  }
}
