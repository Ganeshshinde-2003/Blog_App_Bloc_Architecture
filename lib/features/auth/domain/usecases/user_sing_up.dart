import 'package:blog_app/core/error/failres.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSingUp implements UseCase<String, UserSingUpParams> {
  final AuthRepository authRepository;

  UserSingUp({required this.authRepository});

  @override
  Future<Either<Failure, String>> call(UserSingUpParams params) async {
    return await authRepository.signUpWithEmailAndPassword(
      email: params.email,
      password: params.password,
      name: params.name,
    );
  }
}

class UserSingUpParams {
  final String email;
  final String password;
  final String name;

  UserSingUpParams({
    required this.email,
    required this.password,
    required this.name,
  });
}
