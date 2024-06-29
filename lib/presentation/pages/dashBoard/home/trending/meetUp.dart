import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Widgets/Widgets.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/navigationService.dart';
import '../../../../../routes/appRoutes.dart';

/// trending meetups
class TrendingMeetUps extends StatelessWidget {
  /// constructor
  const TrendingMeetUps({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(5, (index) {
          return Container(
            margin: const EdgeInsets.only(right: 16),
            child: buildCard(context, index),
          );
        }),
      ),
    );
  }

  /// Builds a card widget with a stack of an image and a number displayed on the bottom right corner.
  ///
  /// Parameters:
  /// - context: The build context.
  /// - index: The index of the card.
  ///
  /// Returns:
  /// A Cardd widget with a stack of a ViewAppImage widget and a number displayed on the bottom right corner.
  Widget buildCard(BuildContext context, int index) {
    return Inkk(
      onTap: () {
        NavigatorService.pushNamed(AppRoutes.description);
      },
      child: Cardd(
        child: Stack(
          children: [
            ViewAppImage(
              height: 200.sp,
              width: 200.sp,
              radius: SizeConfig.borderRadius,
              imageUrl:
                  'https://media.licdn.com/dms/image/D5622AQHttm9SU_s1XA/feedshare-shrink_800/0/1703183479635?e=2147483647&v=beta&t=tyQHjp6vIuGit9O9DOcE33Tq8Jnoj4hhCjd3qgHIwb4',
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: EdgeInsets.all(10.sp),
                  // width: 60.sp,
                  // height: 60.sp,
                  decoration: BoxDecoration(
                    color: Colorz.white,
                    borderRadius:
                        BorderRadius.circular(SizeConfig.borderRadius),
                  ),
                  child: Txt(
                    (index + 1).toString().padLeft(2, '0'),
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
