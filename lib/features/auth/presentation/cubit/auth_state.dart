part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final User user;

  AuthSuccess(this.user);
}

final class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
}

final class AuthUserLoggedIn extends AuthState {
  final User user;

  AuthUserLoggedIn(this.user);
}

final class AuthLogoutSuccess extends AuthState {}
