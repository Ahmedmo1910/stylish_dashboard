import 'package:stylish_dashboard/features/add_product/domain/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final String date;
  final String review;
  final num rating;

  ReviewModel(
      {required this.name,
      required this.image,
      required this.date,
      required this.review,
      required this.rating});

  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
      name: reviewEntity.name,
      image: reviewEntity.image,
      date: reviewEntity.date,
      review: reviewEntity.review,
      rating: reviewEntity.rating,
    );
  }
  toJson() {
    return {
      'name': name,
      'image': image,
      'date': date,
      'review': review,
      'rating': rating,
    };
  }
}
