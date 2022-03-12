import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kuisoner_app/services/kriteria_domisili.dart';

part 'kriteriadomisili_state.dart';

class KriteriadomisiliCubit extends Cubit<KriteriadomisiliState> {
  final KriteriaDomisili services;
  KriteriadomisiliCubit(this.services) : super(KriteriadomisiliInitial());

  void getPekerjaan() async {
    emit(KriteriadomisiliLoading());
    try {
      final result = await services.getPekerjaan();
      if (result != null) {
        emit(KriteriadomisiliSuccess(result));
      }
    } catch (e) {
      emit(KriteriadomisiliFailed("getPekerjaan fail"));
    }
  }

  void getStatus() async {
    emit(KriteriadomisiliLoading());
    try {
      final result = await services.getStatus();
      if (result != null) {
        emit(KriteriadomisiliSuccess(result));
      }
    } catch (e) {
      emit(KriteriadomisiliFailed("getStatus fail"));
    }
  }

  void getGender() async {
    emit(KriteriadomisiliLoading());
    try {
      final result = await services.getGender();
      if (result != null) {
        emit(KriteriadomisiliSuccess(result));
      }
    } catch (e) {
      emit(KriteriadomisiliFailed("getGender fail"));
    }
  }

  void getProvinsi() async {
    emit(KriteriadomisiliLoading());
    try {
      final result = await services.getProvinsi();
      if (result != null) {
        emit(KriteriadomisiliSuccess(result));
      }
    } catch (e) {
      emit(KriteriadomisiliFailed("getProvinsi fail"));
    }
  }

  void getKotaByIdProvinsi(int id) async {
    emit(KriteriadomisiliLoading());
    try {
      final result = await services.getKotaByIdProvinsi(id);
      if (result != null) {
        emit(KriteriadomisiliSuccess(result));
      }
    } catch (e) {
      emit(KriteriadomisiliFailed("getKotaByIdProvinsi fail"));
    }
  }

  void getPaket() async {
    emit(KriteriadomisiliLoading());
    try {
      final result = await services.getPaket();
      if (result != null) {
        emit(KriteriadomisiliSuccess(result));
      }
    } catch (e) {
      emit(KriteriadomisiliFailed("getPaketfail"));
    }
  }
}
