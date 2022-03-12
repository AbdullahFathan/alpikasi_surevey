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
        print("data result != null");
        emit(Authenticated(result));
      } else {
        print("data result == null");
        emit(Unauthenticated());
      }
    } catch (e) {
      print("data result == cacth");
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

  void register(
      String email,
      String password,
      String name,
      String username,
      String ttl,
      int id_gender,
      int id_provinsi,
      int id_status,
      int id_pekerjaan,
      int id_kota) async {
    emit(AuthLoading());
    try {
      final result = await services.register(
          email: email,
          password: password,
          username: username,
          ttl: ttl,
          id_gender: id_gender,
          id_kota: id_kota,
          id_pekerjaan: id_pekerjaan,
          id_provinsi: id_provinsi,
          id_status: id_status);
      if (result == true) {
        emit(AuthSuccess('Successfully signup'));
      } else {
        emit(AuthFailed('Signup failed'));
      }
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
