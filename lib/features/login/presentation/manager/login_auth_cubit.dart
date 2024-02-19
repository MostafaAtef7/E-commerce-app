import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_auth_state.dart';

class LoginAuthCubit extends Cubit<LoginAuthState> {
  LoginAuthCubit() : super(LoginAuthInitial());

  Future<void> loginMethod({required String email, required String password}) async {
    emit(LoginAuthLoading());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginAuthSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginAuthFailure(errMsg: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(
            LoginAuthFailure(errMsg: 'Wrong password.'));
      } else {
        emit(LoginAuthFailure(errMsg: 'Something wrong , please try again !'));
      }
    }
  }
}
