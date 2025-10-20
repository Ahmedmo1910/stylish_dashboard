import 'dart:io';
import 'package:stylish_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:stylish_dashboard/features/add_product/domain/entities/review_entity.dart';

class AddProductInputModel {
  final String name;
  final String category;
  final num price;
  final String code;
  final String description;
  String? imageUrl;
  final File imageFile;
  final num avgRating;
  final num ratingCount;
  final List<ReviewEntity> reviews;

  AddProductInputModel({
    required this.name,
    required this.category,
    required this.price,
    required this.code,
    required this.description,
    this.imageUrl,
    required this.imageFile,
    required this.reviews,
    this.avgRating = 0,
    this.ratingCount = 0,
  });

  factory AddProductInputModel.fromEntity(
      AddProductInputEntity addProductInputEntity) {
    return AddProductInputModel(
      name: addProductInputEntity.name,
      category: addProductInputEntity.category,
      price: addProductInputEntity.price,
      code: addProductInputEntity.code,
      description: addProductInputEntity.description,
      imageUrl: addProductInputEntity.imageUrl,
      imageFile: addProductInputEntity.imageFile,
      reviews: addProductInputEntity.reviews,
    );
  }
  toJson() {
    return {
      'name': name,
      'category': category,
      'price': price,
      'code': code,
      'description': description,
      'imageUrl': imageUrl,
      'reviews': reviews
    };
  }
}
