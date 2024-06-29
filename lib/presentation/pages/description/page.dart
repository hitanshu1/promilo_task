import 'package:flutter/material.dart';

import '../../../Widgets/Widgets.dart';
import '../../../Widgets/ratingBar.dart';
import '../../../core/constants/constants.dart';
import 'slider.dart';

/// description page
class DescriptionPage extends StatelessWidget {
  ///constructor
  DescriptionPage({super.key});

  /// description slider
  final List<String> imgList = [
    'https://media.tacdn.com/media/attractions-splice-spp-674x446/06/70/80/16.jpg',
    'https://www.kesari.in/assets/img/group-tour/speciality-tour.jpg',
    'https://d3dqioy2sca31t.cloudfront.net/Projects/cms/production/000/030/471/medium/3ec57aa5c17462aa997c2dc4229b2e73/article-portugal-bus-tour-group.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Description'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: SizeConfig.pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DescriptionSlider(),
              SizeConfig.verticalSpace(),
              _likeBookmarkRating(),
              SizeConfig.verticalSpace(),
              _actorDetails(),
              SizeConfig.verticalSpace(),
              _aboutWidget()
            ],
          ),
        ),
      ),
    );
  }

  /// Returns a widget that displays a row of icons and text.
  ///
  /// The row consists of:
  /// - An `Icon` widget with the `bookmark_border` icon.
  /// - A `SizedBox` widget with a width of 5.
  /// - A `Text` widget displaying the text '1034'.
  /// - A horizontal space.
  /// - An `Icon` widget with the `favorite_border` icon.
  /// - A `SizedBox` widget with a width of 5.
  /// - A `Text` widget displaying the text '1034'.
  /// - A horizontal space.
  /// - A `RatingBar` widget with a rating of 3.2.
  ///
  /// Returns:
  ///   A `Row` widget containing the above widgets.
  Widget _likeBookmarkRating() {
    return Row(
      children: [
          Icon(Icons.bookmark_border,color: Colorz.blueAccent,size: SizeConfig.mediumFont),
        const SizedBox(width: 5),
        const Text('1034'),
        SizeConfig.horizontalSpace(),
         Icon(Icons.favorite_border,color: Colorz.blueAccent,
        size: SizeConfig.mediumFont,),
        const SizedBox(width: 5),
        const Text('1034'),
        SizeConfig.horizontalSpace(),
        const RatingBarr(
          rating: 3.2,
        ),
      ],
    );
  }

  /// Returns a widget that displays the actor name, role, duration, and fees.
  ///
  /// The widget is a `Column` widget that contains:
  /// - A `Txt` widget displaying the actor name in bold with a font size of 18.
  /// - A `Txt` widget displaying the role in grey.
  /// - A vertical space.
  /// - A `Row` widget containing:
  ///   - An `Icon` widget displaying the `access_time` icon.
  ///   - A `SizedBox` widget with a width of 5.
  ///   - A `Txt` widget displaying the duration.
  /// - A `SizedBox` widget with a height of 5.
  /// - A `Row` widget containing:
  ///   - An `Icon` widget displaying the `wallet` icon.
  ///   - A `SizedBox` widget with a width of 5.
  ///   - A `Txt` widget displaying the total average fees.
  ///
  /// Returns:
  ///   A `Column` widget containing the actor name, role, duration, and fees.
  Widget _actorDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Txt(
          'Actor Name',
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        const Txt(
          'Indian Actress',
          color: Colors.black,
        ),
        SizeConfig.verticalSpace(),
        const Row(
          children: [
            Icon(Icons.access_time),
            SizedBox(width: 5),
            Txt('Duration 20 Mins'),
          ],
        ),
        const SizedBox(height: 5),
        const Row(
          children: [
            Icon(Icons.wallet),
            SizedBox(width: 5),
            Txt('Total Average Fees ₹9,999'),
          ],
        ),
      ],
    );
  }

/// Returns a widget that displays the about section.
///
/// The widget is a `Column` widget that contains:
/// - A `Txt` widget displaying the text "About" in bold with a font size of 16.
/// - A `SizedBox` widget with a height of 5.
/// - A `Txt` widget displaying a long paragraph of text.
///
/// Returns:
///   A `Column` widget containing the about section.
  Widget _aboutWidget() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Txt(
        'About',
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      SizedBox(height: 5),
      Txt(
        'From cardiovascular health to fitness, flexibility, balance, stress relief, better sleep, increased cognitive performance, and more, you can reap all of these benefits in just one session out on the waves. So, you may find yourself wondering what are the benefits of going on a surf camp.',
      ),
    ]);
  }
}
