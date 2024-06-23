import 'package:blog_app/core/error/failres.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });

  Future<Either<Failure, String>> logInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
