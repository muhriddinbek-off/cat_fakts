part of 'detail_bloc.dart';

@immutable
sealed class DetailEvent {}

final class DetailFetch extends DetailEvent {
  final String id;
  DetailFetch(this.id);
}
