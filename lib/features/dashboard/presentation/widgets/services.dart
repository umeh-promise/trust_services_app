import 'package:flutter/material.dart';
import 'package:trust_services_app/core/theme/sizes.dart';
import 'package:trust_services_app/features/dashboard/presentation/widgets/home_heading.dart';
import 'package:trust_services_app/features/dashboard/presentation/widgets/service_card.dart';

final categories = [
  {'name': 'Sommy Hair & services', 'icon': 'assets/img/service_3.png'},
  {'name': 'Saloon', 'icon': 'assets/img/service_2.png'},
  {'name': 'Sommy Hair & services', 'icon': 'assets/img/service_1_fixed.png'},
  {'name': 'Cleaning', 'icon': 'assets/img/service_3.png'},
  {'name': 'Plumbing', 'icon': 'assets/img/service_2.png'},
];

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeHeading(onPressed: () {}, title: 'Popular Services'),
          SizedBox(
            height: 285,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return ServiceCard(
                  name: category['name'] as String,
                  icon: category['icon'] as String,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
