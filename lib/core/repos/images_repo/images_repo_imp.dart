import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:stylish_dashboard/core/errors/failures.dart';
import 'package:stylish_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:stylish_dashboard/core/services/fire_base_auth_service.dart';
import 'package:stylish_dashboard/core/services/storage_service.dart';
import 'package:stylish_dashboard/core/utils/backend_endpoint.dart';

class ImagesRepoImp implements ImagesRepo {
  final StorageService storageService;
  final FireBaseAuthService fireBaseAuthService;
  ImagesRepoImp(
      {required this.storageService, required this.fireBaseAuthService});
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      if (!fireBaseAuthService.isLoggedIn()) {
        return Left(ServerFailure('User not logged in'));
      }
      String url =
          await storageService.uploadFile(image, BackendEndpoint.images);
      return Right(url);
    } catch (e) {
      return Left(ServerFailure('Failed to upload image: $e'));
    }
  }
}
