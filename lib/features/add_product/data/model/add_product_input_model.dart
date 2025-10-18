import 'dart:io';

import 'package:stylish_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class AddProductInputModel {
  final String name;
  final String category;
  final num price;
  final String code;
  final String description;
  String? imageUrl;
  final File imageFile;

  AddProductInputModel(
      {required this.name,
      required this.category,
      required this.price,
      required this.code,
      required this.description,
      this.imageUrl,
      required this.imageFile});

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
      'imageFile': imageFile.path
    };
  }
}
