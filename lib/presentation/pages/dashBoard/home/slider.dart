import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Widgets/Views/horizontalSlider.dart';
import '../../../../Widgets/Widgets.dart';
import '../../../../core/constants/constants.dart';

/// home slider
class HomeSlider extends StatelessWidget {
  /// constructor
   HomeSlider({super.key});

/// list of images
 final List<String> images = [
'https://images.inc.com/uploaded_files/image/1920x1080/getty_473909426_129584.jpg',
'https://imageio.forbes.com/specials-images/imageserve/5eb6bb89170c9400064865a7/0x0.jpg?format=jpg&height=900&width=1600&fit=bounds',
'https://cdn-clppm.nitrocdn.com/jJRwhUySpmBiZVDZtJMwhTYymMvpDjuf/assets/images/optimized/rev-69fe4b3/www.avanta.co.in/wp-content/uploads/2015/02/Meeting-Room-in-Delhi.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return HorizontalSlider(
        item: (int index) {
          return _card(width: width,imageUrl: images[index]);
        },
        itemCount: images.length);
  }

  Widget _card({
    double width = 0,
    String ?imageUrl
  }) {
    return Stack(
      children: [
        ViewAppImage(
          radius: 10.sp,
          imageUrl:
              imageUrl,
        ),
        Positioned.fill(
          child: ClipRect(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.black.withOpacity(0.7), // Fully blurred
                    Colors.black.withOpacity(0.5), // Partially blurred
                    Colors.black.withOpacity(0.1), // No blur
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(SizeConfig.spaceBetween * 2),
                    child: SizedBox(
                      width: width * .4,
                      child: Txt(
                        'Popular Meetups of India',
                        color: Colorz.white,
                        fontSize: SizeConfig.largeFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
