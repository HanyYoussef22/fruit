import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit/core/helpers/constants.dart';
import 'package:fruit/core/theming/style/styles.dart';

class OffersSlider extends StatelessWidget {
  final List<String> images;
  final List<String> titles;
  final List<String> descriptions;

  const OffersSlider({
    Key? key,
    required this.images,
    required this.titles,
    required this.descriptions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Check if all lists have the same length
    if (images.length != titles.length || images.length != descriptions.length) {
      throw Exception('Images, titles, and descriptions lists must have the same length!');
    }

    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0, // Height of the slider
        autoPlay: true, // Enable auto-slide
        enlargeCenterPage: true, // Enlarge the current slide
        viewportFraction: 1, // Fraction of the screen each slide occupies
        autoPlayInterval: Duration(seconds: 5), // Interval between slides
        aspectRatio: 16 / 9,
        autoPlayAnimationDuration: Duration(milliseconds: 2500),
      ),
      items: List.generate(images.length, (index) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),

              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Background Image
                    Image.network(
                      images[index],
                      fit: BoxFit.cover,
                    ),

                    // Text Content
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width*0.45,
                        height: 200,
                        child: SvgPicture.asset(Assets.slide,fit: BoxFit.fill,),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          titles[index],
                          style: Styles.font35BoldWhite,
                        ),
                        SizedBox(height: 5),
                        Text(
                          descriptions[index],
                          style:Styles.font20BoldWhite,textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
