import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFunctions {
  static Future<void> login(
    String emailAddress,
    String password, {
    required Function onSuccess,
    required Function onError,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      if (credential.user!.emailVerified) {
        onSuccess();
      } else {
        onError("Email not verified");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        onError('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        onError('Wrong password provided for that user.');
      } else {
        onError(e.code);
      }
    }
  }

  static Future<void> createUser(
    String email,
    String password,
    String name, {
    required Function onSuccess,
    required Function onError,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      credential.user!.sendEmailVerification();
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        onError('The account already exists for that email.');
      } else {
        onError(e.code);
      }
    } catch (e) {
      onError(e.toString());
    }
  }
}
