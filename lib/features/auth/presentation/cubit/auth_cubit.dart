import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_services_app/core/usecase/usecase.dart';
import 'package:trust_services_app/features/auth/domain/entities/user.dart';
import 'package:trust_services_app/features/auth/domain/usecases/current_user_usecase.dart';
import 'package:trust_services_app/features/auth/domain/usecases/login_user_usecase.dart';
import 'package:trust_services_app/features/auth/domain/usecases/logout_usecase.dart';
import 'package:trust_services_app/features/auth/domain/usecases/user_signup_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final UserSignupUsecase _signupUsecase;
  final CurrentUserUsecase _currentUserUsecase;
  final LoginUserUsecase _loginUserUsecase;
  final LogoutUsecase _logoutUsecase;

  AuthCubit({
    required UserSignupUsecase signupUsecase,
    required CurrentUserUsecase currentUserUsecase,
    required LoginUserUsecase loginUserUsecase,
    required LogoutUsecase logoutUsecase,
  }) : _signupUsecase = signupUsecase,
       _currentUserUsecase = currentUserUsecase,
       _loginUserUsecase = loginUserUsecase,
       _logoutUsecase = logoutUsecase,
       super(AuthInitial());

  void authLoggedInUser() async {
    emit(AuthLoading());

    final response = await _currentUserUsecase(NoParams());

    response.fold((l) => emit(AuthFailure(l.message)), (r) => _updateUser(r));
  }

  Future<void> signup(SignupParams params) async {
    emit(AuthLoading());
    final response = await _signupUsecase(params);

    response.fold((l) => emit(AuthFailure(l.message)), (r) => _updateUser(r));
  }

  Future<void> login(LoginUserParams params) async {
    emit(AuthLoading());
    final response = await _loginUserUsecase(params);

    response.fold((l) => emit(AuthFailure(l.message)), (r) => _updateUser(r));
  }

  void _updateUser(User? user) {
    if (user == null) {
      emit(AuthInitial());
    } else {
      emit(AuthSuccess(user));
      // emit(AuthUserLoggedIn(user));
    }
  }

  void logout() async {
    final response = await _logoutUsecase(NoParams());

    response.fold(
      (l) => emit(AuthFailure(l.message)),
      (r) => emit(AuthLogoutSuccess()),
    );
  }
}
