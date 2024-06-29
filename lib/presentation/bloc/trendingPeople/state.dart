
import 'package:equatable/equatable.dart';

import '../../../data/models/meetUpPeople.dart';

/// trending popular people state
abstract class TrendingPeopleState extends Equatable {
  /// constructor
  const TrendingPeopleState();
  @override
  List<Object?> get props => [];

}

/// trending popular people initial
class TrendingPeopleInitial extends TrendingPeopleState {
  @override
  List<Object> get props => [];
}
/// trending popular people loading
class TrendingPeopleLoading extends TrendingPeopleState {
  @override
  List<Object> get props => [];
}

/// trending popular people loaded
class TrendingPeopleLoaded extends TrendingPeopleState {
  /// trending popular people
final List<MeetupPeople> trendingPeople;
/// constructor
 const TrendingPeopleLoaded(this.trendingPeople);
  @override
  List<Object> get props => [trendingPeople];
}
/// trending popular people error
class TrendingPeopleError extends TrendingPeopleState {
  /// error message
  final String message;
  /// constructor
  const TrendingPeopleError(this.message);
  @override
  List<Object> get props => [message];
}
