part of 'sign_up_auth_cubit.dart';

@immutable
sealed class SignUpAuthState {}

final class SignUpAuthInitial extends SignUpAuthState {}
final class SignUpAuthLoading extends SignUpAuthState {}
final class SignUpAuthSuccess extends SignUpAuthState {}
final class SignUpAuthFailure extends SignUpAuthState {
  final String errMsg;

  SignUpAuthFailure({required this.errMsg});
}
