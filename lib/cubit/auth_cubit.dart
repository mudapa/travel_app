import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel_app/models/user_model.dart';
import 'package:travel_app/services/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  // Note: Sign Up user
  void signUp({
    required String name,
    required String email,
    required String password,
    String hobby = '',
  }) async {
    try {
      // Note: Change state to loading
      emit(AuthLoading());

      // Note: Sign up user
      UserModel user = await AuthService().signUp(
        name: name,
        email: email,
        password: password,
        hobby: hobby,
      );

      // Note: Change state to success
      emit(AuthSuccess(user));
    } catch (e) {
      // Note: Change state to failed
      emit(AuthFailed(e.toString()));
    }
  }

  // Note: Sign out user
  void signOut() async {
    try {
      // Note: Change state to loading
      emit(AuthLoading());

      // Note: Sign out user
      await AuthService().signOut();

      // Note: Change state to initial
      emit(AuthInitial());
    } catch (e) {
      // Note: Change state to failed
      emit(AuthFailed(e.toString()));
    }
  }

  // Note: Get user
  void getCurrentUser(String id) async {
    try {
      // Note: Change state to loading
      emit(AuthLoading());

      // Note: Get user from firestore
      UserModel user = await AuthService().getUserById(id);

      // Note: Change state to success
      emit(AuthSuccess(user));
    } catch (e) {
      // Note: Change state to failed
      emit(AuthFailed(e.toString()));
    }
  }

  // Note: Sign in user
  void signIn({
    required String email,
    required String password,
  }) async {
    try {
      // Note: Change state to loading
      emit(AuthLoading());

      // Note: Sign in user
      UserModel user = await AuthService().signIn(
        email: email,
        password: password,
      );

      // Note: Change state to success
      emit(AuthSuccess(user));
    } catch (e) {
      // Note: Change state to failed
      emit(AuthFailed(e.toString()));
    }
  }
}
