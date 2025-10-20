import 'package:dartz/dartz.dart';
import 'package:stylish_dashboard/core/errors/failures.dart';
import 'package:stylish_dashboard/features/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  );
 
  Future saveUserData({required UserEntity user});
  Future<UserEntity> getUserData({required String uid});
}
