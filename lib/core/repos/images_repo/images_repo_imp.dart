import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:stylish_dashboard/core/errors/failures.dart';
import 'package:stylish_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:stylish_dashboard/core/services/storage_service.dart';
import 'package:stylish_dashboard/core/utils/backend_endpoint.dart';

class ImagesRepoImp implements ImagesRepo {
  final StorageService storageService;
  ImagesRepoImp({required this.storageService});
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url =
          await storageService.uploadFile(image, BackendEndpoint.images);
      return Right(url);
    } catch (e) {
      return Left(ServerFailure('Failed to upload image: $e'));
    }
  }
}
