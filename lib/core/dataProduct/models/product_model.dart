
import 'package:fruit/core/dataProduct/models/review_model.dart';

import '../entities/product_entities.dart';

class ProductModel extends ProductEntities {

  ProductModel(
      {required super.name,
        required super.reviews,
        required super.code,
        required super.description,
        required super.price,
        required super.image,
        required super.isFeatured, required super.sellingCount,});


  toMap(){
    return {
      'reviews': reviews.map((review) => review.toJson()).toList(),
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'image': image,
      'isFeatured': isFeatured,

    };
  }

  factory ProductModel.fromFirestore(ProductEntities product){
    return ProductModel(
      reviews: product.reviews,
      name: product.name,
      code: product.code,
      description: product.description,
      price: product.price,
      image: product.image,
      isFeatured: product.isFeatured, sellingCount: product.sellingCount,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json){
    return ProductModel(
      reviews: (json['reviews'] as List).map((e) => ReviewModel.fromJson(e)).toList(),
      name: json['name'],
      code: json['code'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      isFeatured: json['isFeatured'], sellingCount: json['sellingCount'],
    );
  }
}



