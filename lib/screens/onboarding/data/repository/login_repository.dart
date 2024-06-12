import 'package:dreamfarm/utilities/firebase_auth/auth.dart';
import 'package:dreamfarm/utilities/modals/custom_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepository {
  Future loginAccount(String email, String password) async {
    try {
      if (email == null || password == null || email == "" || password == "") {
        throw CustomException(
            message: "Error : Kindly fill all the fields", code: 0);
      }
      Auth _auth = Auth();
      UserCredential cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw CustomException(
          message: "Authentication Error : ${e.message}", code: 0);
    } on CustomException {
      rethrow;
    }
  }

  Future sendPasswordResetLink(String email) async {
    try {
      if (email == null || email == "") {
        throw CustomException(message: "Kindly enter the email !", code: 0);
      }
      Auth _auth = Auth();
      _auth.sendResetPasswordLink(email);
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message!, code: 0);
    } on CustomException {
      rethrow;
    }
  }
}
