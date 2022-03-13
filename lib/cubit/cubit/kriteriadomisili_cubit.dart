import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kuisoner_app/services/kriteria_domisili.dart';

part 'kriteriadomisili_state.dart';

class KriteriadomisiliCubit extends Cubit<KriteriadomisiliState> {
  final KriteriaDomisili services;
  KriteriadomisiliCubit(this.services) : super(KriteriadomisiliInitial());

  void getKriteria() async {
    emit(KriteriadomisiliLoading());

    try {
      final resultPaket = await services.getPaket();
      final resultProvinsi = await services.getProvinsi();
      final resultGender = await services.getGender();
      final resultStatus = await services.getStatus();
      final resultPekerjaan = await services.getPekerjaan();

      if (resultPaket != null &&
          resultProvinsi != null &&
          resultGender != null &&
          resultStatus != null &&
          resultPekerjaan != null) {
        emit(KriteriadomisiliSuccess(
          resultPekerjaan,
          resultStatus,
          resultGender,
          resultProvinsi,
        ));
      }
    } catch (e) {
      emit(KriteriadomisiliFailed("getPekerjaan fail"));
    }
  }

  void getKotaByIdProvinsi(int id) async {
    emit(KriteriadomisiliLoading());
    try {
      final result = await services.getKotaByIdProvinsi(id);
      if (result != null) {
        emit(KriteriaKota(result));
      }
    } catch (e) {
      emit(KriteriadomisiliFailed("getKotaByIdProvinsi fail"));
    }
  }
}
