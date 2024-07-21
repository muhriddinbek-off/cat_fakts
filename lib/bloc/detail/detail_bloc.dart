import 'package:bloc/bloc.dart';
import 'package:cat_fakts/models/core/cat_info/cat_info.dart';
import 'package:cat_fakts/models/data/repository/cats_repository.dart';
import 'package:meta/meta.dart';
part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final CatsRepository catsRepository;
  DetailBloc(this.catsRepository) : super(DetailInitial()) {
    on<DetailFetch>(_getInfo);
  }
  void _getInfo(DetailFetch event, Emitter<DetailState> emit) async {
    emit(DetailLoading());
    try {
      final data = await catsRepository.getCatInfo(event.id);
      emit(DetailSuccess(data));
    } catch (e) {
      emit(DetailError(e.toString()));
    }
  }
}
