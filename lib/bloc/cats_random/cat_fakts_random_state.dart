part of 'cat_fakts_random_bloc.dart';

@immutable
sealed class CatFaktsRandomState {}

final class CatFaktsRandomInitial extends CatFaktsRandomState {}

final class CatFaktsRandomLoading extends CatFaktsRandomState {}

final class CatFaktsRandomSuccess extends CatFaktsRandomState {
  final List<CatsFakts> catsFakts;
  CatFaktsRandomSuccess(this.catsFakts);
}

final class CatFaktsRandomError extends CatFaktsRandomState {
  final String errorMassage;
  CatFaktsRandomError(this.errorMassage);
}
