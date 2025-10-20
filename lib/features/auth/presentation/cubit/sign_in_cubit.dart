import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish_dashboard/features/auth/domain/entites/user_entity.dart';
import 'package:stylish_dashboard/features/auth/domain/repos/auth_repo.dart';

part 'sign_in_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;
  Future<void> signin(String email, String password) async {
    emit(SigninLoading());
    final result = await authRepo.signInWithEmailAndPassword(email, password);

    result.fold(
      (failure) => emit(
        SigninFailure(message: failure.message),
      ),
      (userEntity) => emit(
        SigninSuccess(userEntity: userEntity),
      ),
    );
  }
}
