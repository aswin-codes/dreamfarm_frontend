import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future signInWithEmailAndPassword(
      {required String email, required String password}) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  Future createUserWithEmailAndPassword(
      {required String email,
      required String password}) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);

    return userCredential;
  }

  Future sendResetPasswordLink(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future updateProfilePicture(String url) async {
    await _firebaseAuth.currentUser!.updatePhotoURL(url);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
