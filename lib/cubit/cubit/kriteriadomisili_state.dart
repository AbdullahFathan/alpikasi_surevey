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
  List<Object?> hasil;
  KriteriadomisiliSuccess(this.hasil);
  @override
  List<Object?> get props => [hasil];
}

class KriteriadomisiliFailed extends KriteriadomisiliState {
  String pesan;
  KriteriadomisiliFailed(this.pesan);
  @override
  List<Object?> get props => [pesan];
}
