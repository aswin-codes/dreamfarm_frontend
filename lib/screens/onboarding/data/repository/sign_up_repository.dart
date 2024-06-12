import 'package:dreamfarm/screens/onboarding/data/models/user_model.dart';
import 'package:dreamfarm/utilities/firebase_auth/auth.dart';
import 'package:dreamfarm/utilities/modals/custom_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepository {
  Future createAccount(String fullName, String email, String password,
      String phoneNumber) async {
    Auth auth = Auth();
    try {
      if (fullName == null ||
          email == null ||
          password == null ||
          phoneNumber == null ||
          fullName == "" ||
          email == "" ||
          password == "" ||
          phoneNumber == "") {
        throw CustomException(message: "Error : Kindly fill all fields", code: 0);
      }
      UserCredential cred = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      //Need to add logic to store user details and manage the session
    } on FirebaseAuthException catch (e) {
      throw CustomException(
          message: "Authentication Error : ${e.message}", code: 0);
    } on CustomException {
      rethrow;
    }
  }
}
