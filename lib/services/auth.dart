import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;

  static Future<User?> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      final User _user = _auth.currentUser!;
      return _user;
    } catch (error) {
      print(error);
    }
    return null;
  }
}