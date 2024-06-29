import 'package:equatable/equatable.dart';

/// trending popular people event
abstract class TrendingPeopleEvent extends Equatable {
  /// constructor
  const TrendingPeopleEvent();
  @override
  
  List<Object?> get props => [];
}
/// get trending people
class GetTrendingPeople extends TrendingPeopleEvent{}
