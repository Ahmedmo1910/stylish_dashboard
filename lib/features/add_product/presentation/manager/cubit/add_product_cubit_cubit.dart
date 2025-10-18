import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:stylish_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:stylish_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

part 'add_product_cubit_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imagesRepo, this.productsRepo)
      : super(AddProductInitial());

  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;

  Future<void> addProduct(AddProductInputEntity addProductInputEntity) async {
    emit(AddProductLoading());
    var result = await imagesRepo.uploadImage(addProductInputEntity.imageFile);
    return result.fold((f) {
      AddProductFailure(f.message);
    }, (url) async {
      addProductInputEntity.imageUrl = url;
      var result = await productsRepo.addProduct(addProductInputEntity);
      return result.fold((f) {
        emit(AddProductFailure(f.message));
      }, (_) {
        emit(AddProductSuccess());
      });
    });
  }
}
