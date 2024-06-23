import 'package:blog_app/core/secretes/app_secretes.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:blog_app/features/auth/domain/usecases/user_sing_up.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
    url: AppSecretes.superBaseURL,
    anonKey: AppSecretes.superBaseAnonKey,
  );

  serviceLocator.registerLazySingleton(() => supabase.client);
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImple(
      supabaseClient: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => UserSingUp(
      authRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      userSingUp: serviceLocator(),
    ),
  );
}
