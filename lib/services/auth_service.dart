import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Daftar
  Future<User?> register(String email, String password) async {
    final userCred = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCred.user;
  }

  // Login
  Future<User?> login(String email, String password) async {
    final userCred = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCred.user;
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
  }
}
