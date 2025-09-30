import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:trust_services_app/core/theme/colors.dart';

final List<Map<String, String>> _carouselItems = [
  {
    "title": "Best in providing fast job services",
    "subtitle":
        "We work with verified job service providers.\nWhat are you looking for? Professional plumbers, hairstylists, electricians, etc.",
  },
  {
    "title": "Trusted professionals for every service",
    "subtitle":
        "From home repairs to beauty experts - book verified professionals near you.",
  },
  {
    "title": "Fast, reliable, and affordable",
    "subtitle": "Get services done by experts who value your time and money.",
  },
];

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel(
      options: FlutterCarouselOptions(
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        height: 240,
        viewportFraction: 1.0,
        enableInfiniteScroll: true,
        indicatorMargin: 10,
        slideIndicator: CircularSlideIndicator(
          slideIndicatorOptions: SlideIndicatorOptions(
            currentIndicatorColor: AppPallete.primaryColor,
            indicatorBackgroundColor: AppPallete.whiteColor,
          ),
        ),
        reverse: true,
      ),
      items: _carouselItems
          .map(
            (item) => Column(
              spacing: 14,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title'] as String,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppPallete.whiteColor,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${item['subtitle']}',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppPallete.whiteColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
