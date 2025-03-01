import '../models/review_model.dart';

class ProductEntities {
  final int sellingCount;
  final String name;
  final String code;
  final String description;
  final double price;
  final String image;
  final bool isFeatured;
  final num rateCount = 0;
  final num avgRate = 0.0;
  final List<ReviewModel> reviews;

  ProductEntities({
    required this.sellingCount,
    required this.reviews,
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.isFeatured,
  });
}