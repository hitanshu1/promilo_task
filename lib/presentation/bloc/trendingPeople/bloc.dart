import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/data_sources/dummyData.dart';
import 'event.dart';
import 'state.dart';

/// trending popular people bloc
class TrendingPeopleBloc
    extends Bloc<TrendingPeopleEvent, TrendingPeopleState> {
  /// constructor
  TrendingPeopleBloc() : super(TrendingPeopleInitial()) {
    on<GetTrendingPeople>(_getTrendingPeople);
  }

  // Handles the event to get trending people. Emits loading state, implements event handler, and emits loaded state with trending people data.
  void _getTrendingPeople(
      GetTrendingPeople event, Emitter<TrendingPeopleState> emit) {
    emit(TrendingPeopleLoading());
    /// implement event handler

    emit(TrendingPeopleLoaded(Dummydata.trendingPeople));
  }
}
