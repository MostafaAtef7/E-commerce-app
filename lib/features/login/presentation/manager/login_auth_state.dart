part of 'login_auth_cubit.dart';

@immutable
sealed class LoginAuthState {}

final class LoginAuthInitial extends LoginAuthState {}
final class LoginAuthLoading extends LoginAuthState {}
final class LoginAuthSuccess extends LoginAuthState {}
final class LoginAuthFailure extends LoginAuthState {
  final String errMsg;

  LoginAuthFailure({required this.errMsg});
}
