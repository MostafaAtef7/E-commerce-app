part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginAuthLoading extends AuthState {}

final class LoginAuthSuccess extends AuthState {}

final class LoginAuthFailure extends AuthState {
  final String errMsg;

  LoginAuthFailure({required this.errMsg});
}

final class SignUpAuthLoading extends AuthState {}

final class SignUpAuthSuccess extends AuthState {}

final class SignUpAuthFailure extends AuthState {
  final String errMsg;

  SignUpAuthFailure({required this.errMsg});
}
