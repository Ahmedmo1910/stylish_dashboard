import 'dart:io';

class AddProductInputEntity {
  final String name;
  final String category;
  final num price;
  final String code;
  final String description;
  String? imageUrl;
  final File imageFile;

  AddProductInputEntity(
      {required this.name,
      required this.category,
      required this.price,
      required this.code,
      required this.description,
      this.imageUrl,
      required this.imageFile});
}
