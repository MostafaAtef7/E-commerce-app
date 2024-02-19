import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> loginMethod(
      {required String email, required String password}) async {
    emit(LoginAuthLoading());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginAuthSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginAuthFailure(errMsg: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginAuthFailure(errMsg: 'Wrong password.'));
      } else {
        emit(LoginAuthFailure(errMsg: 'Something wrong , please try again !'));
      }
    }
  }

  Future<void> signUpMethod(
      {required String email, required String password}) async {
    emit(SignUpAuthLoading());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(SignUpAuthSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpAuthFailure(errMsg: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpAuthFailure(
            errMsg: 'The account already exists for that email.'));
      } else {
        emit(SignUpAuthFailure(errMsg: 'Something wrong , please try again !'));
      }
    }
  }

  Future<void> signInWithGoogle() async {
    emit(LoginAuthLoading());
    try {
      print("!!!!!!!!!!!!1111111");
      if (FirebaseAuth.instance.currentUser != null) {
        await FirebaseAuth.instance.signOut();
        await GoogleSignIn().signOut();
      } else {
        // Trigger Google Sign In
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        print("!!!!!!!!!!!!1111111");

        // Get authentication details from Google
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        // Create Firebase credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);

        emit(LoginAuthSuccess());

        // Optional: Perform additional actions after successful sign-in
        print('Google Sign-In Success!');
      }
    } on FirebaseAuthException catch (e) {
      print('Sign in exception->$e');
      emit(LoginAuthFailure(errMsg: "Failed Sign in by google"));
    }
  }

  Future<void> signOutFromGoogle() async {
    emit(LoginAuthLoading());

    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      emit(LoginAuthSuccess());
    } on FirebaseAuthException catch (e) {
      print('Sign Out exception->$e');
      emit(LoginAuthFailure(errMsg: "Failed to Log out"));
    }
  }
}
