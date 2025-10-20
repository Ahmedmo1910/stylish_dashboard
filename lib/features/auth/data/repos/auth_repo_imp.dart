import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stylish_dashboard/core/errors/exceptions.dart';
import 'package:stylish_dashboard/core/errors/failures.dart';
import 'package:stylish_dashboard/core/services/database_service.dart';
import 'package:stylish_dashboard/core/services/fire_base_auth_service.dart';
import 'package:stylish_dashboard/core/services/shared_preferences_singleton.dart';
import 'package:stylish_dashboard/core/utils/backend_endpoint.dart';
import 'package:stylish_dashboard/features/auth/data/models/user_model.dart';
import 'package:stylish_dashboard/features/auth/domain/entites/user_entity.dart';
import 'package:stylish_dashboard/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  final FireBaseAuthService fireBaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImp({
    required this.fireBaseAuthService,
    required this.databaseService,
  });

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await fireBaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      var userEntity = await getUserData(uid: user.uid);
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoIml.signInWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailure('An unknown error occurred: $e'));
    }
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await databaseService.getData(
      path: BackendEndpoint.getAdminData,
      docId: uid,
    );
    print('📘 Fetching admin with uid: $uid');
    print('📘 path: ${BackendEndpoint.getAdminData}');
    print('📘 userData: $userData');

    return UserModel.fromJson(userData);
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await prefs.setString('adminData', jsonData);
  }
}
