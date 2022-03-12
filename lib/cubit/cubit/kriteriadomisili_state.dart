part of 'kriteriadomisili_cubit.dart';

abstract class KriteriadomisiliState extends Equatable {
  const KriteriadomisiliState();
}

class KriteriadomisiliInitial extends KriteriadomisiliState {
  @override
  List<Object?> get props => [];
}

class KriteriadomisiliLoading extends KriteriadomisiliState {
  @override
  List<Object?> get props => [];
}

class KriteriadomisiliSuccess extends KriteriadomisiliState {
  List<Object?> hasil1;
  List<Object?> hasil2;
  List<Object?> hasil3;
  List<Object?> hasil4;
  KriteriadomisiliSuccess(
    this.hasil1,
    this.hasil2,
    this.hasil3,
    this.hasil4,
  );
  @override
  List<Object?> get props => [
        hasil1,
        hasil2,
        hasil3,
        hasil4,
      ];
}

class KriteriadomisiliFailed extends KriteriadomisiliState {
  String pesan;
  KriteriadomisiliFailed(this.pesan);
  @override
  List<Object?> get props => [pesan];
}

class KriteriaKota extends KriteriadomisiliState {
  List<Object?> hasil;
  KriteriaKota(this.hasil);

  @override
  List<Object?> get props => [hasil];
}
