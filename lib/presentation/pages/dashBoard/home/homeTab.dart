import 'package:flutter/material.dart';

import '../../../../Widgets/Widgets.dart';
import '../../../../core/constants/constants.dart';
import 'slider.dart';
import 'trending/meetUp.dart';
import 'trending/people.dart';

/// home tab
class HomeTab extends StatelessWidget {
  /// constructor
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:  SizeConfig.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:   [
            TxtField.search(
              onChanged: (val) {
                print(val);
              },
            ),
            const SizedBox(height: 10),
             HomeSlider(),
            SizeConfig.verticalSpaceLarge(),
            Widgets.heading(
              text: 'Trending Popular People',
              color: Colorz.blueAccent
            ),
            SizeConfig.verticalSpace(),
            
            const TrendingPropularPeople(),
            SizeConfig.verticalSpaceLarge(),
            Widgets.heading(
              text: 'Top Trending Meetups',
              color: Colorz.blueAccent
            ),
           SizeConfig.verticalSpace(),
            const TrendingMeetUps()
           
          ],
        ),
      ),
    );
  }





}
