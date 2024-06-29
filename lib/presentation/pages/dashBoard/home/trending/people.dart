import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Widgets/Widgets.dart';
import '../../../../../Widgets/circularImage.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../data/models/meetUpPeople.dart';
import '../../../../bloc/trendingPeople/bloc.dart';
import '../../../../bloc/trendingPeople/event.dart';
import '../../../../bloc/trendingPeople/state.dart';

/// trending popular people
class TrendingPropularPeople extends StatelessWidget {
  /// constructor
  const TrendingPropularPeople({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider<TrendingPeopleBloc>(
      create: (_) => TrendingPeopleBloc()..add(GetTrendingPeople()),
      child: BlocBuilder<TrendingPeopleBloc, TrendingPeopleState>(
          builder: (context, state) {
        if (state is TrendingPeopleInitial||state is TrendingPeopleLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TrendingPeopleLoaded) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                state.trendingPeople.length, (index) {
                return Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: buildCard(context, state.trendingPeople[index]),
                );
              }),
            ),
          );

        } else {
          return Widgets.notFoundWidget();
        }
        
      }),
    );
  }

  /// Builds a card widget to display information about a MeetupPeople.
  /// 
  /// Parameters:
  /// - context: The build context.
  /// - people: The MeetupPeople object to display information from.
  /// 
  /// Returns:
  ///A Container widget representing the card with styling and information about the MeetupPeople.
  Widget buildCard(BuildContext context, MeetupPeople people) {
    return Cardd(
      width: 280.sp,
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircularImage(
                imageUrl: people.authorImage,
                size: 30.sp,
              ),
            
             SizeConfig.horizontalSpace(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Txt(
                    people.author,
                   fontWeight: FontWeight.bold,
                  ),
                  Txt(
                    '${people.totalMeetUp} Meetups',
                    color: Colorz.gray,
                  ),
                ],
              ),
            ],
          ),
          const Divider(
            thickness: 2,
          ),
          buildOverlappingUsers(
            list: people.participants??[]
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Button(
                text: 'See more',
                onPressed: (){
              
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Builds a widget displaying a list of avatars with overlapping positioning based on the provided list of participants.
/// Builds a widget with overlapping circular images based on a list of participants.
///
/// Parameters:
/// - [list]: A required list of [Participant] objects with their image URLs.
///
/// Returns:
/// A [SizedBox] widget containing a [Stack] of [CircularImage] widgets, each positioned
/// horizontally based on its index in the list.
Widget buildOverlappingUsers({required List<Perticipant> list}) {
  return SizedBox(
    height: 50.sp, // Adjust based on your needs
    child: Stack(
      children: List.generate(list.length, (index) {
        return Positioned(
          left: index * 30.0, // Adjust the overlap by changing the value here
          child: CircularImage(
            imageUrl: list[index].imageUrl,
            size: 40.sp,
          ),
        );
      }),
    ),
  );
}
 
}
