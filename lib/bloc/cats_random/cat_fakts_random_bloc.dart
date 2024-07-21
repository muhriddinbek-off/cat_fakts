import 'package:bloc/bloc.dart';
import 'package:cat_fakts/models/core/cats_random/cats_random.dart';
import 'package:cat_fakts/models/data/repository/cats_repository.dart';
import 'package:flutter/material.dart';

part 'cat_fakts_random_event.dart';
part 'cat_fakts_random_state.dart';

class CatFaktsRandomBloc extends Bloc<CatFaktsRandomEvent, CatFaktsRandomState> {
  final CatsRepository catsRepository;
  CatFaktsRandomBloc(this.catsRepository) : super(CatFaktsRandomInitial()) {
    on<CatsRandomFactsFetch>(_getCatsRandom);
  }

  void _getCatsRandom(CatsRandomFactsFetch event, Emitter<CatFaktsRandomState> emit) async {
    emit(CatFaktsRandomLoading());
    try {
      final data = await catsRepository.getRandom();
      emit(CatFaktsRandomSuccess(data));
    } catch (e) {
      emit(CatFaktsRandomError(e.toString()));
    }
  }
}
