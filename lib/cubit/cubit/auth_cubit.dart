import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kuisoner_app/models/user.dart';

import '../../services/auth_services.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthServices services;
  AuthCubit(this.services) : super(AuthInitial());

  void checkAuth() async {
    emit(AuthLoading());
    try {
      final result = await services.checkAuth();
      if (result != null) {
        emit(Authenticated(result));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void login(String email, String password) async {
    emit(AuthLoading());
    try {
      final result = await services.login(email: email, password: password);
      if (result == true) {
        emit(AuthSuccess('Successfully logged in'));
        print("Data masuk if ");
      } else {
        emit(AuthFailed('Login failed'));
        print("Data masuk else");
      }
    } catch (e) {
      emit(AuthFailed(e.toString()));
      print("Data masuk catch");
    }
  }
}
