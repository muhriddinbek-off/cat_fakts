part of 'detail_bloc.dart';

@immutable
sealed class DetailState {}

final class DetailInitial extends DetailState {}

final class DetailLoading extends DetailState {}

final class DetailSuccess extends DetailState {
  final CatsDetail catsDetail;
  DetailSuccess(this.catsDetail);
}

final class DetailError extends DetailState {
  final String errorMassage;
  DetailError(this.errorMassage);
}
