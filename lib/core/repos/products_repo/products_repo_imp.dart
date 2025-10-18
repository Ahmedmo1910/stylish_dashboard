import 'package:dartz/dartz.dart';
import 'package:stylish_dashboard/core/errors/failures.dart';
import 'package:stylish_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:stylish_dashboard/core/services/database_service.dart';
import 'package:stylish_dashboard/core/utils/backend_endpoint.dart';
import 'package:stylish_dashboard/features/add_product/data/model/add_product_input_model.dart';
import 'package:stylish_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class ProductsRepoImp implements ProductsRepo {
  final DatabaseService databaseService;
  ProductsRepoImp({required this.databaseService});
  @override
  Future<Either<Failure, void>> addProduct(
      AddProductInputEntity addProductInputEntity) async {
    try {
      await databaseService.addData(
          path: BackendEndpoint.addProducts,
          data:
              AddProductInputModel.fromEntity(addProductInputEntity).toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to add product: $e'));
    }
  }
}
