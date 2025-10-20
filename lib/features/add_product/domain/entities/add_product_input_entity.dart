import 'dart:io';

import 'package:stylish_dashboard/features/add_product/domain/entities/review_entity.dart';

class AddProductInputEntity {
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

  AddProductInputEntity(
      {required this.name,
      required this.category,
      required this.price,
      required this.code,
      required this.description,
      this.imageUrl,
      required this.imageFile,
      required this.reviews,
      this.avgRating = 0,
      this.ratingCount = 0
      });
}
