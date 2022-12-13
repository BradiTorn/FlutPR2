class ProductEntity {
  late int id;
  final String productName;
  final String description;
  final int providerId;
  final int categoryId;
  final int price;
  final int count;

  ProductEntity(
      {required this.productName,
      required this.description,
      required this.providerId,
      required this.categoryId,
      required this.price,
      required this.count});
}
