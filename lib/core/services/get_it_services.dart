import 'package:get_it/get_it.dart';
import 'package:stylish_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:stylish_dashboard/core/repos/images_repo/images_repo_imp.dart';
import 'package:stylish_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:stylish_dashboard/core/repos/products_repo/products_repo_imp.dart';
import 'package:stylish_dashboard/core/services/database_service.dart';
import 'package:stylish_dashboard/core/services/fire_base_auth_service.dart';
import 'package:stylish_dashboard/core/services/fire_storage.dart';
import 'package:stylish_dashboard/core/services/firestore_service.dart';
import 'package:stylish_dashboard/core/services/storage_service.dart';
import 'package:stylish_dashboard/features/auth/data/repos/auth_repo_imp.dart';
import 'package:stylish_dashboard/features/auth/domain/repos/auth_repo.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FireBaseAuthService>(FireBaseAuthService());
  getIt.registerSingleton<StorageService>(FireStorage());
  getIt.registerSingleton<DatabaseService>(FirestoreService());
  getIt.registerSingleton<ImagesRepo>(
    ImagesRepoImp(
        storageService: getIt<StorageService>(),
        fireBaseAuthService: getIt<FireBaseAuthService>()),
  );
  getIt.registerSingleton<ProductsRepo>(
      ProductsRepoImp(databaseService: getIt<DatabaseService>()));
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImp(
      fireBaseAuthService: getIt<FireBaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
}
