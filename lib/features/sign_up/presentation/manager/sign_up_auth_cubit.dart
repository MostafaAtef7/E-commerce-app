import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_up_auth_state.dart';

class SignUpAuthCubit extends Cubit<SignUpAuthState> {
  SignUpAuthCubit() : super(SignUpAuthInitial());

  Future<void> signUpMethod(
      {required String email, required String password}) async {
        emit(SignUpAuthLoading());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
          emit(SignUpAuthSuccess());
    } on FirebaseAuthException catch (e) {

       if (e.code == 'weak-password') {
        emit(SignUpAuthFailure(
            errMsg: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpAuthFailure(
            errMsg: 'The account already exists for that email.'));
      } else {
        emit(SignUpAuthFailure(
            errMsg: 'Something wrong , please try again !'));
      }
    }
  }
}
