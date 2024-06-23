import 'package:blog_app/features/auth/domain/usecases/user_sing_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSingUp _userSingUp;

  AuthBloc({required UserSingUp userSingUp})
      : _userSingUp = userSingUp,
        super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      final res = await _userSingUp(
        UserSingUpParams(
          email: event.email,
          password: event.password,
          name: event.name,
        ),
      );

      res.fold(
        (l) => emit(AuthFailure(message: l.message)),
        (r) => emit(AuthSuccess(userId: r)),
      );
    });
  }
}
