import 'package:blog_app/core/error/exception.dart';
import 'package:blog_app/core/error/failres.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_app/features/auth/domain/entities/user.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failure, User>> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final user = await authRemoteDataSource.signUpWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
