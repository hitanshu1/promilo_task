import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Widgets/Views/horizontalSlider.dart';
import '../../../Widgets/Widgets.dart';
import '../../../core/constants/constants.dart';
import '../../../core/utils/shareService.dart';

/// description slider
class DescriptionSlider extends StatelessWidget {
  /// constructor
  DescriptionSlider({super.key});

  /// sample image list
  final List<String> imgList = [
    'https://media.tacdn.com/media/attractions-splice-spp-674x446/06/70/80/16.jpg',
    'https://www.kesari.in/assets/img/group-tour/speciality-tour.jpg',
    'https://d3dqioy2sca31t.cloudfront.net/Projects/cms/production/000/030/471/medium/3ec57aa5c17462aa997c2dc4229b2e73/article-portugal-bus-tour-group.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Cardd(
      color: Colors.grey[300],
      child: Column(
        children: [
          HorizontalSlider(
              height: 300.sp,
              autoPlay: false,
              onImageIndicator: true,
              enlargeCenterPage: false,
              item: (int index) {
                return ViewAppImage(
                  radius: SizeConfig.borderRadius,
                  imageUrl: imgList[index],
                );
              },
              itemCount: imgList.length),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.download),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.bookmark_border),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.fullscreen),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.star_border),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {
                  ShareService.shareText(
                      'check out my website https://example.com',
                      subject: 'Look what I made!');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
