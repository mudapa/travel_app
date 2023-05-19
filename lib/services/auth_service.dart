import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_app/models/user_model.dart';
import 'package:travel_app/services/user_service.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Note: Sign up user
  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
    String hobby = '',
  }) async {
    try {
      // Note:Create a new user
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Note: Create a user data in firestore
      UserModel user = UserModel(
        id: userCredential.user!.uid,
        email: email,
        name: name,
        hobby: hobby,
        balance: 280000000,
      );

      // Note: Set user to firestore
      await UserService().setUser(user);

      // Note: Return user
      return user;
    } catch (e) {
      rethrow;
    }
  }

  // Note: Sign Out user
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  // Note: Get user from firestore
  Future<UserModel> getUserById(String id) async {
    try {
      // Note: Get user data
      User? user = _auth.currentUser;
      return await UserService().getUserById(user!.uid);
    } catch (e) {
      rethrow;
    }
  }

  // Note: Sign in user
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      // Note: Sign in user
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Note: Get user from firestore
      UserModel user =
          await UserService().getUserById(userCredential.user!.uid);

      // Note: Return user
      return user;
    } catch (e) {
      rethrow;
    }
  }
}
